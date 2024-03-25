import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_bloc.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_event.dart';
import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:expense_tracker/resorses/app_textstyles.dart';
import 'package:expense_tracker/resorses/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../bloc/expense_tracker_state.dart';
import '../widgets/expense_list_view.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _fromDate;
  DateTime? _toDate;
  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchExpense();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: _handleOnFilterTap, icon: const Icon(Icons.menu))
        ],
      ),
      body: BlocConsumer<ExpenseTrackerBloc, ExpenseTrackerState>(
        listenWhen: (previous, current) =>
            current is AddingExpenseSuccess ||
            current is EditingExpenseSuccess ||
            current is DeletingExpenseSuccess,
        listener: (context, state) {
          _fetchExpense(fromDt: _fromDate, toDt: _toDate);
        },
        buildWhen: (previous, current) =>
            current is GettingExpenses ||
            current is GettingExpensesFailed ||
            current is GettingExpensesSuccess,
        builder: (context, state) {
          return state.maybeWhen(() => const SizedBox(),
              gettingExpensesFailed: (failure) => Center(
                    child: Text(Failure.getErrorMessage(failure)),
                  ),
              gettingExpenses: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              gettingExpensesSuccesss: (data, dates, fromDate, toDate) =>
                  Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.yellow.withOpacity(.5),
                                      AppColors.yellow.withOpacity(.3)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: SafeArea(
                              top: true,
                              child: Column(
                                children: [
                                  Text(
                                    'Account Balance',
                                    style: AppTextStyles.largeBold,
                                  ),
                                  Text(
                                    '\$${data.balace}',
                                    style: AppTextStyles.title,
                                  ),
                                  fromDate != null && toDate != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                              'From ${DateFormat('dd-MM-yyyy').format(fromDate)} to ${DateFormat('dd-MM-yyyy').format(toDate)}'),
                                        )
                                      : const SizedBox(
                                          height: 20,
                                        ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildExpenseTile(
                                            amount: data.totalIncome,
                                            assetPath:
                                                'assets/icons/income.svg',
                                            bagroundColor: AppColors.green,
                                            title: 'Income'),
                                      ),
                                      Dimens.constWidth,
                                      Expanded(
                                        child: _buildExpenseTile(
                                            amount: data.totalExpense,
                                            assetPath:
                                                'assets/icons/expense.svg',
                                            bagroundColor: AppColors.red,
                                            title: 'Expense'),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: ExpenseListView(
                              dates: dates,
                              expenseList: data.expenseList,
                            ),
                          ))
                    ],
                  ),
              orElse: () => const SizedBox());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOnFloatingButtonClicked,
        child: const Icon(Icons.add),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: _validateFromDate,
                  onTap: _handleOnFromDateTap,
                  readOnly: true,
                  controller: _fromDateController,
                  decoration: const InputDecoration(labelText: 'Form Date'),
                ),
                Dimens.constHeight,
                TextFormField(
                  validator: _validateToDate,
                  onTap: _handleOnToTap,
                  readOnly: true,
                  controller: _toDateController,
                  decoration: const InputDecoration(labelText: 'To Date'),
                ),
                const Spacer(),
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: _handleOnFilterReset,
                          child: const Text('Reset'))),
                  Dimens.constWidth,
                  Expanded(
                    child: ElevatedButton(
                        onPressed: _handleOnFilterApply,
                        child: const Text('Apply')),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildExpenseTile(
      {required String assetPath,
      required String title,
      required amount,
      required Color bagroundColor}) {
    return Container(
      decoration: BoxDecoration(
          color: bagroundColor, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16)),
            child: SvgPicture.asset(assetPath),
          ),
          Dimens.constWidth,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.largeBold.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '\$$amount',
                style: AppTextStyles.largeBold.copyWith(color: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  void _handleOnFilterTap() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _fetchExpense({DateTime? fromDt, DateTime? toDt}) {
    context
        .read<ExpenseTrackerBloc>()
        .add(GetExpenses(fromDt: fromDt, toDt: toDt));
  }

  void _handleOnFromDateTap() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: _fromDate);
    if (date != null && date != _fromDate) {
      _fromDate = date;
      _fromDateController.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  void _handleOnToTap() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: _toDate);
    if (date != null && date != _fromDate) {
      _toDate = date;
      _toDateController.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  void _handleOnFilterApply() {
    if (_formKey.currentState!.validate()) {
      context.read<ExpenseTrackerBloc>().state.maybeMap(
            (value) => null,
            gettingExpenses: (value) => null,
            orElse: () {
              context
                  .read<ExpenseTrackerBloc>()
                  .add(GetExpenses(fromDt: _fromDate, toDt: _toDate));
            },
          );
      context.router.popForced();
    }
  }

  String? _validateFromDate(String? value) {
    if (_fromDate == null) {
      return 'Please select a from date';
    } else {
      return null;
    }
  }

  String? _validateToDate(String? value) {
    if (_toDate == null) {
      return 'Please select a to date';
    } else if (_fromDate != null && _fromDate!.isAfter(_toDate!)) {
      return 'Please select a to date after the from date';
    } else {
      return null;
    }
  }

  void _handleOnFilterReset() {
    context.read<ExpenseTrackerBloc>().state.maybeMap(
          (value) => null,
          gettingExpenses: (value) => null,
          orElse: () {
            context.read<ExpenseTrackerBloc>().add(const GetExpenses());
            context.router.popForced();
          },
        );
  }

  void _handleOnFloatingButtonClicked() {
    context.router.push(AddExpenseTrackerRoute());
  }
}
