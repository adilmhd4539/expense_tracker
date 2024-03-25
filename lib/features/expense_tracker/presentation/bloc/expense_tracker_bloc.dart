import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:expense_tracker/features/expense_tracker/domain/usecases/expense_tracker_use_case.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_event.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_state.dart';
import 'package:expense_tracker/resorses/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseTrackerBloc
    extends Bloc<ExpenseTrackerEvent, ExpenseTrackerState> {
  final ExpenseTrackerUsecase _usecase;
  final AppRouter _router;
  ExpenseTrackerBloc(this._usecase, this._router)
      : super(ExpenseTrackerState.initatl()) {
    on<FeachCategories>(_handleOnFeachCategories);
    on<AddExpense>(_handleOnAddExpense);
    on<GetExpenses>(_handleOnGettingExpenses);
    on<EditExpense>(_handleOnEditExpense);
    on<DeleteExpense>(_handleOnDeleteExpense);
    on<GetChartData>(_handleOnGettingChartData);
  }
  FutureOr<void> _handleOnAddExpense(
      AddExpense event, Emitter<ExpenseTrackerState> emit) async {
    emit(AddingExpense());
    final result = await _usecase.addExpense(
        amount: event.amount,
        categoryId: event.categoryId,
        notes: event.notes,
        date: event.dateTime);
    result.fold((error) {
      emit(AddingExpenseFailed(failure: error));
      _handleOnaddingFailed(Failure.getErrorMessage(error));
    }, (r) {
      _router.navigatorKey.currentContext!.router.popForced();

      emit(AddingExpenseSuccess());
    });
  }

  void _handleOnaddingFailed(String message) {
    ScaffoldMessenger.of(_router.navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(_router.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  FutureOr<void> _handleOnFeachCategories(
      FeachCategories event, Emitter<ExpenseTrackerState> emit) async {
    emit(ExpenseTrackerState.feachingCategories());
    final result =
        await _usecase.getCategories(categoryType: event.categoryType);
    result.fold(
        (error) =>
            emit(ExpenseTrackerState.categoryFetchingError(failure: error)),
        (categories) => emit(ExpenseTrackerState.categoryFetchingSuccess(
            categories: categories)));
  }

  FutureOr<void> _handleOnGettingExpenses(
      GetExpenses event, Emitter<ExpenseTrackerState> emit) async {
    emit(GettingExpenses());
    final result =
        await _usecase.getExpenses(fromDt: event.fromDt, toDt: event.toDt);
    result.fold((error) => emit(GettingExpensesFailed(failure: error)), (data) {
      List<DateTime> dates = [];
      for (final expense in data.expenseList) {
        if (!dates
            .any((element) => DateUtils.isSameDay(element, expense.date))) {
          dates.add(expense.date);
        }
      }

      emit(GettingExpensesSuccess(
          data: data,
          dates: dates,
          fromDate: event.fromDt,
          toDate: event.toDt));
    });
  }

  FutureOr<void> _handleOnEditExpense(
      EditExpense event, Emitter<ExpenseTrackerState> emit) async {
    emit(EditingExpense());
    final result = await _usecase.editExpense(expense: event.expense);
    result.fold((error) {
      _handleOnaddingFailed(Failure.getErrorMessage(error));
      emit(EditingExpenseFailed(failure: error));
    }, (r) {
      _router.navigatorKey.currentContext!.router.popForced();
      emit(EditingExpenseSuccess());
    });
  }

  FutureOr<void> _handleOnDeleteExpense(
      DeleteExpense event, Emitter<ExpenseTrackerState> emit) async {
    emit(DeletingExpense());
    final result = await _usecase.deleteExpense(id: event.id);
    result.fold((error) {
      _handleOnaddingFailed(Failure.getErrorMessage(error));
      emit(DeletingExpenseFailed(failure: error));
    }, (r) {
      _router.navigatorKey.currentContext!.router.popForced();
      emit(DeletingExpenseSuccess());
    });
  }

  FutureOr<void> _handleOnGettingChartData(
      GetChartData event, Emitter<ExpenseTrackerState> emit) async {
    emit(GetingChartData());
    final result = await _usecase.getChartData(
        categoryType: event.categoryType,
        fromDt: event.fromDt,
        toDt: event.toDate);
    result.fold((error) => emit(GetingChartFiled(failure: error)), (response) {
      List<Color> colors = response.categories
          .map(
            (e) => AppColors.getRandomColor(),
          )
          .toList();
      emit(GettingChartDataSuccess(
          data: response,
          colors: colors,
          fromDt: event.fromDt,
          toDt: event.toDate));
    });
  }
}
