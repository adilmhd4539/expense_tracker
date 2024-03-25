import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_bloc.dart';
import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:expense_tracker/resorses/app_textstyles.dart';
import 'package:expense_tracker/resorses/dimens.dart';
import 'package:expense_tracker/resorses/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expense_tracker_event.dart';
import '../bloc/expense_tracker_state.dart';

@RoutePage()
class AddExpenseTrackerScreen extends StatefulWidget {
  final Expense? expense;
  const AddExpenseTrackerScreen({super.key, this.expense});

  @override
  State<AddExpenseTrackerScreen> createState() =>
      _AddExpenseTrackerScreenState();
}

class _AddExpenseTrackerScreenState extends State<AddExpenseTrackerScreen> {
  final ValueNotifier<CategoryType> _categoryTypeNotifier =
      ValueNotifier<CategoryType>(CategoryType.income);
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()));
  final TextEditingController _notesController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  int? _categoryiId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _fetchCategories(
        categoryType:
            widget.expense?.category.categoryType ?? CategoryType.income);
    if (widget.expense != null) {
      _preloadData(widget.expense!);
    }
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    _categoryTypeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: _categoryTypeNotifier,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kToolbarHeight,
                        ),
                        DefaultTabController(
                          length: 2,
                          initialIndex: widget.expense?.category.categoryType ==
                                  CategoryType.expense
                              ? 1
                              : 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: TabBar(
                              onTap: _handleOnTabChanged,
                              labelColor: AppColors.white,
                              unselectedLabelColor: AppColors.blue,
                              indicatorPadding: const EdgeInsets.all(5),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              dividerHeight: 0,
                              tabs: [
                                Tab(
                                  child: Text(
                                    //TODO:ADD BILIGUAL
                                    'Income',
                                    style: AppTextStyles.bodyLargeBold
                                        .copyWith(color: AppColors.black),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    //TODO:ADD BILIGUAL
                                    'Expense',
                                    style: AppTextStyles.bodyLargeBold
                                        .copyWith(color: AppColors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors.white,
                          validator: _validateAmount,
                          style: AppTextStyles.title
                              .copyWith(color: AppColors.white),
                          decoration: InputDecoration(
                            hintText: '0.00',
                            hintStyle: AppTextStyles.title
                                .copyWith(color: AppColors.white),
                            focusedBorder: _buildBorder(),
                            prefixIconConstraints:
                                const BoxConstraints(maxWidth: 40),
                            disabledBorder: _buildBorder(),
                            border: _buildBorder(),
                            errorBorder: _buildBorder(),
                            enabledBorder: _buildBorder(),
                            prefixIcon: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "\$",
                                style: AppTextStyles.title
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    builder: (context, value, child) {
                      return Container(
                          color: value == CategoryType.income
                              ? AppColors.blue
                              : AppColors.red,
                          child: child);
                    })),
            Expanded(
                child: Container(
              color: AppColors.blue,
              child: BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
                buildWhen: (previous, current) {
                  if (current is FeachingCategories ||
                      current is CategoryFetchingError ||
                      current is CategoryFetchingSuccess) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  return state.maybeWhen(() => const SizedBox(),
                      categoryFetchingError: (failure) => Center(
                            child: Text(failure.toString()),
                          ),
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                      categoryFetchingSuccess: (categories) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable:
                                              _categoryTypeNotifier,
                                          builder: (context, value, _) {
                                            return DropdownButtonFormField<int>(
                                              value: value ==
                                                      widget.expense?.category
                                                          .categoryType
                                                  ? widget.expense!.category
                                                      .categoryId
                                                  : null,
                                              validator:
                                                  _validateCategoryDropDown,
                                              decoration: const InputDecoration(
                                                  //TODO:ADD BILIGUAL
                                                  labelText: 'Category'),
                                              items: categories
                                                  .map((e) => DropdownMenuItem(
                                                        value: e.categoryId,
                                                        child: Text(
                                                            e.categoryName),
                                                      ))
                                                  .toList(),
                                              onChanged:
                                                  _handleOnCategoryChanged,
                                            );
                                          }),
                                      Dimens.constHeight,
                                      TextFormField(
                                        controller: _dateController,
                                        readOnly: true,
                                        onTap: _handleOnDateFiledTaped,
                                        decoration: const InputDecoration(
                                            //TODO:ADD BILIGUAL
                                            labelText: 'Date'),
                                      ),
                                      Dimens.constHeight,
                                      TextFormField(
                                        maxLines: 3,
                                        decoration: const InputDecoration(
                                            //TODO:ADD BILIGUAL
                                            labelText: 'Notes'),
                                        controller: _notesController,
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.constHeight,
                                Row(children: [
                                  BlocBuilder<ExpenseTrackerBloc,
                                      ExpenseTrackerState>(
                                    buildWhen: (previous, current) =>
                                        current is DeletingExpense ||
                                        current is DeletingExpenseSuccess ||
                                        current is DeletingExpenseFailed,
                                    builder: (context, state) {
                                      return widget.expense != null
                                          ? Expanded(
                                              child: ElevatedButton(
                                                  onPressed: _handleOnDelete,
                                                  child: state.maybeWhen(
                                                    () => const Text('Delete'),
                                                    orElse: () =>
                                                        const Text('Delete'),
                                                    deletingExpense: () =>
                                                        const CircularProgressIndicator(),
                                                  )))
                                          : const SizedBox();
                                    },
                                  ),
                                  SizedBox(
                                    width: widget.expense != null ? 10 : null,
                                  ),
                                  Expanded(
                                    child: BlocBuilder<ExpenseTrackerBloc,
                                        ExpenseTrackerState>(
                                      buildWhen: (previous, current) {
                                        if (current is AddingExpense ||
                                            current is AddingExpenseFailed ||
                                            current is AddingExpenseSuccess ||
                                            current is EditingExpense ||
                                            current is EditingExpenseFailed ||
                                            current is EditingExpenseSuccess) {
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      },
                                      builder: (context, state) {
                                        return ElevatedButton(
                                            onPressed: _handleOnAdd,
                                            //TODO:ADD BILINGUAL
                                            child: state.maybeMap(
                                                (value) => Text(
                                                    widget.expense != null
                                                        ? 'Edit'
                                                        : 'Add'),
                                                orElse: () => Text(
                                                    widget.expense != null
                                                        ? 'Edit'
                                                        : 'Add'),
                                                editingExpens: (value) =>
                                                    const CircularProgressIndicator(),
                                                addingExpense: (value) =>
                                                    const CircularProgressIndicator()));
                                      },
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ));
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  String? _validateCategoryDropDown(value) {
    if (value == null || _categoryiId == null) {
      //TODO:ADD BILINGUAL
      return 'Please select a category';
    } else {
      return null;
    }
  }

  void _handleOnCategoryChanged(value) {
    _categoryiId = value;
  }

  void _handleOnTabChanged(int value) {
    if (value == 0 && _categoryTypeNotifier.value != CategoryType.income) {
      _categoryTypeNotifier.value = CategoryType.income;
      _fetchCategories(categoryType: CategoryType.income);
    } else if (value == 1 &&
        _categoryTypeNotifier.value != CategoryType.expense) {
      _categoryTypeNotifier.value = CategoryType.expense;
      _fetchCategories(categoryType: CategoryType.expense);
    }
  }

  _fetchCategories({required CategoryType categoryType}) {
    context
        .read<ExpenseTrackerBloc>()
        .add(FeachCategories(categoryType: categoryType));
  }

  InputBorder _buildBorder() => InputBorder.none;

  Future<void> _handleOnDateFiledTaped() async {
    final DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: _dateTime);
    if (date != null && date != _dateTime) {
      _dateTime = date;
      _dateController.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  String? _validateAmount(String? value) {
    if (value == null || double.tryParse(value) == null) {
      //TODO: ADD BILIGUAL
      return 'Please enter a valid amount';
    } else {
      return null;
    }
  }

  void _handleOnAdd() {
    if (_formKey.currentState!.validate()) {
      context.read<ExpenseTrackerBloc>().state.maybeMap((value) => null,
          deletingExpense: (value) => null,
          editingExpens: (value) => null,
          addingExpense: (value) => null,
          orElse: () {
            if (widget.expense == null) {
              context.read<ExpenseTrackerBloc>().add(AddExpense(
                  categoryId: _categoryiId!,
                  amount: double.parse(_amountController.text),
                  notes: _notesController.text,
                  dateTime: _dateTime));
            } else {
              context.read<ExpenseTrackerBloc>().add(EditExpense(
                  expense: widget.expense!.copyWith(
                      amount: double.parse(_amountController.text),
                      category: widget.expense!.category
                          .copyWith(categoryId: _categoryiId!),
                      notes: _notesController.text,
                      date: _dateTime)));
            }
          });
    }
  }

  void _preloadData(Expense expense) {
    _amountController.text = '${expense.amount}';
    _categoryTypeNotifier.value = expense.category.categoryType;
    _categoryiId = expense.category.categoryId;
    _dateController.text = DateFormat('dd-MM-yyyy').format(expense.date);
    _dateTime = expense.date;
    _notesController.text = expense.notes;
  }

  void _handleOnDelete() {
    context.read<ExpenseTrackerBloc>().state.maybeMap(
          (value) => null,
          deletingExpense: (value) => null,
          editingExpens: (value) => null,
          orElse: () {
            context
                .read<ExpenseTrackerBloc>()
                .add(DeleteExpense(id: widget.expense!.id));
          },
        );
  }
}
