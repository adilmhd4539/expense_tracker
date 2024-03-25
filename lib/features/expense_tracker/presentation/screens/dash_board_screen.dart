import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/category_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_event.dart';
import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:expense_tracker/resorses/app_textstyles.dart';
import 'package:expense_tracker/resorses/dimens.dart';
import 'package:expense_tracker/resorses/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expense_tracker_bloc.dart';
import '../bloc/expense_tracker_state.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  DateTime? _fromDt;
  DateTime? _toDt;
  CategoryType _categoryType = CategoryType.income;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fechCategories(
        categoryType: CategoryType.income, fromDate: _fromDt, toDate: _toDt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Dimens.constHeight,
            DefaultTabController(
              length: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TabBar(
                  onTap: _handleOnTabChanged,
                  labelColor: AppColors.blue,
                  unselectedLabelColor: AppColors.white,
                  indicatorPadding: const EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)),
                  dividerHeight: 0,
                  tabs: const [
                    Tab(
                      text: 'Income',
                    ),
                    Tab(
                      text: 'Expense',
                    ),
                  ],
                ),
              ),
            ),
            Dimens.constHeight,
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: _fromDateController,
                    validator: _validateFromDt,
                    onTap: _handleOnFromDtTap,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: 'From Date'),
                  )),
                  Dimens.constWidth,
                  Expanded(
                      child: TextFormField(
                    controller: _toDateController,
                    onTap: _handleOnToDateTap,
                    validator: _validateToDt,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: 'To Date'),
                  )),
                  Dimens.constWidth,
                  BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        () => const SizedBox(),
                        getingChartSuccess: (data, colors, fromDt, toDt) =>
                            ElevatedButton(
                                onPressed: () {
                                  if (fromDt != null && toDt != null) {
                                    _fromDt == null;
                                    _toDt == null;
                                    _toDateController.text = '';
                                    _fromDateController.text = '';
                                    _fechCategories(
                                        categoryType: _categoryType);
                                  } else {
                                    _handleOnFilerApply(
                                        categoryType: _categoryType);
                                  }
                                },
                                child: Icon(fromDt != null && toDt != null
                                    ? Icons.close
                                    : Icons.arrow_forward_ios)),
                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
                buildWhen: (previous, current) =>
                    current is GetingChartData ||
                    current is GettingExpensesFailed ||
                    current is GettingChartDataSuccess,
                builder: (context, state) {
                  return state.maybeWhen(
                    getingChartData: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    getingChartSuccess: (data, colorList, fromDt, toDt) =>
                        ListView(
                      children: [
                        Dimens.constHeight,
                        Wrap(
                          spacing: 10,
                          children: [
                            _buildSugesionTile(
                                title: 'This week',
                                onTap: _handleOnThisWeekTap),
                            _buildSugesionTile(
                                title: 'This month',
                                onTap: _handleOnThisMonthSelected),
                            _buildSugesionTile(
                                title: 'This year',
                                onTap: _handleOnThisYearSelected)
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SfCircularChart(
                            annotations: [
                              CircularChartAnnotation(
                                  widget: Text(
                                '\$${data.totalAmout}',
                                style: AppTextStyles.subTitle,
                              ))
                            ],
                            series: <DoughnutSeries<Category, String>>[
                              DoughnutSeries<Category, String>(
                                innerRadius: "60%",
                                dataLabelMapper: (datum, index) =>
                                    datum.categoryName,
                                explode: true,
                                explodeIndex: 0,
                                pointColorMapper: (datum, index) =>
                                    colorList[index],
                                dataSource: data.categories,
                                yValueMapper: (datum, index) =>
                                    datum.totalAmount,
                                xValueMapper: (datum, index) =>
                                    datum.categoryName,
                              ),
                            ],
                          ),
                        ),
                        Dimens.constHeight,
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                _buildCategoryWiseTile(data.categories[index],
                                    colorList[index], data.totalAmout),
                            separatorBuilder: (context, index) =>
                                Dimens.constHeight,
                            itemCount: data.categories.length)
                      ],
                    ),
                    getingChartDataFailed: (failure) => Center(
                      child: Text(Failure.getErrorMessage(failure)),
                    ),
                    () => const SizedBox(),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSugesionTile({
    required String title,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppTextStyles.bodyNormal.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  void _handleOnFilerApply({required CategoryType categoryType}) {
    if (_formKey.currentState!.validate()) {
      context.read<ExpenseTrackerBloc>().state.maybeMap(
            (value) => null,
            getingChartSuccess: (value) {
              _fechCategories(
                  categoryType: categoryType, fromDate: _fromDt, toDate: _toDt);
            },
            orElse: () => null,
          );
    }
  }

  void _fechCategories({
    required CategoryType categoryType,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    context.read<ExpenseTrackerBloc>().state.maybeWhen(
          () => null,
          orElse: () {
            context.read<ExpenseTrackerBloc>().add(GetChartData(
                categoryType: categoryType, fromDt: fromDate, toDate: toDate));
            _categoryType = categoryType;
          },
          getingChartData: () => null,
        );
  }

  Widget? _buildCategoryWiseTile(
      Category category, Color color, double totalAmout) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              flex: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: color,
                  ),
                  Dimens.constWidth,
                  Flexible(
                      child: Text(
                    category.categoryName,
                    style: AppTextStyles.largeNormal,
                  ))
                ],
              ),
            ),
            const Spacer(),
            Text(
              category.totalAmount.toStringAsFixed(2),
              style: AppTextStyles.largeSemiBold.copyWith(
                  color: category.categoryType == CategoryType.income
                      ? AppColors.green
                      : AppColors.red),
            )
          ],
        ),
        Dimens.constHeight,
        LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          value: (category.totalAmount / totalAmout),
        )
      ],
    );
  }

  void _handleOnTabChanged(int value) {
    if (value == 0) {
      _fechCategories(
          categoryType: CategoryType.income, fromDate: _fromDt, toDate: _toDt);
    } else {
      _fechCategories(
          categoryType: CategoryType.expense, fromDate: _fromDt, toDate: _toDt);
    }
  }

  void _handleOnToDateTap() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: _toDt);
    if (date != null && date != _fromDt) {
      _toDt = date;
      _toDateController.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  void _handleOnFromDtTap() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: _fromDt);
    if (date != null && date != _fromDt) {
      _fromDt = date;
      _fromDateController.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  String? _validateFromDt(String? value) {
    if (_fromDt == null) {
      return 'Please select a from date';
    } else {
      return null;
    }
  }

  String? _validateToDt(String? value) {
    if (_toDt == null) {
      return 'Please select a to date';
    } else if (_fromDt != null && _fromDt!.isAfter(_toDt!)) {
      return 'Please select a to date after the from date';
    } else {
      return null;
    }
  }

  void _handleOnThisWeekTap() {
    DateTime today = DateTime.now();
    _fromDt = today.subtract(Duration(days: today.weekday - 1));
    _toDt = today;
    _fromDateController.text = DateFormat('dd-MM-yyyy').format(_fromDt!);
    _toDateController.text = DateFormat('dd-MM-yyyy').format(_toDt!);
  }

  void _handleOnThisMonthSelected() {
    DateTime today = DateTime.now();
    _fromDt = DateTime(today.year, today.month);
    _toDt = today;
    _fromDateController.text = DateFormat('dd-MM-yyyy').format(_fromDt!);
    _toDateController.text = DateFormat('dd-MM-yyyy').format(_toDt!);
  }

  void _handleOnThisYearSelected() {
    DateTime today = DateTime.now();
    _fromDt = DateTime(
      today.year,
    );
    _toDt = today;
    _fromDateController.text = DateFormat('dd-MM-yyyy').format(_fromDt!);
    _toDateController.text = DateFormat('dd-MM-yyyy').format(_toDt!);
  }
}
