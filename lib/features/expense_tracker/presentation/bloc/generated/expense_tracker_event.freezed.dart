// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../expense_tracker_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpenseTrackerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseTrackerEventCopyWith<$Res> {
  factory $ExpenseTrackerEventCopyWith(
          ExpenseTrackerEvent value, $Res Function(ExpenseTrackerEvent) then) =
      _$ExpenseTrackerEventCopyWithImpl<$Res, ExpenseTrackerEvent>;
}

/// @nodoc
class _$ExpenseTrackerEventCopyWithImpl<$Res, $Val extends ExpenseTrackerEvent>
    implements $ExpenseTrackerEventCopyWith<$Res> {
  _$ExpenseTrackerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FeachCategoriesImplCopyWith<$Res> {
  factory _$$FeachCategoriesImplCopyWith(_$FeachCategoriesImpl value,
          $Res Function(_$FeachCategoriesImpl) then) =
      __$$FeachCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryType categoryType});
}

/// @nodoc
class __$$FeachCategoriesImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$FeachCategoriesImpl>
    implements _$$FeachCategoriesImplCopyWith<$Res> {
  __$$FeachCategoriesImplCopyWithImpl(
      _$FeachCategoriesImpl _value, $Res Function(_$FeachCategoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
  }) {
    return _then(_$FeachCategoriesImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
    ));
  }
}

/// @nodoc

class _$FeachCategoriesImpl
    with DiagnosticableTreeMixin
    implements FeachCategories {
  const _$FeachCategoriesImpl({required this.categoryType});

  @override
  final CategoryType categoryType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.feachCategories(categoryType: $categoryType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.feachCategories'))
      ..add(DiagnosticsProperty('categoryType', categoryType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeachCategoriesImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeachCategoriesImplCopyWith<_$FeachCategoriesImpl> get copyWith =>
      __$$FeachCategoriesImplCopyWithImpl<_$FeachCategoriesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return feachCategories(categoryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return feachCategories?.call(categoryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (feachCategories != null) {
      return feachCategories(categoryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return feachCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return feachCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (feachCategories != null) {
      return feachCategories(this);
    }
    return orElse();
  }
}

abstract class FeachCategories implements ExpenseTrackerEvent {
  const factory FeachCategories({required final CategoryType categoryType}) =
      _$FeachCategoriesImpl;

  CategoryType get categoryType;
  @JsonKey(ignore: true)
  _$$FeachCategoriesImplCopyWith<_$FeachCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddExpenseImplCopyWith<$Res> {
  factory _$$AddExpenseImplCopyWith(
          _$AddExpenseImpl value, $Res Function(_$AddExpenseImpl) then) =
      __$$AddExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId, double amount, String notes, DateTime dateTime});
}

/// @nodoc
class __$$AddExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$AddExpenseImpl>
    implements _$$AddExpenseImplCopyWith<$Res> {
  __$$AddExpenseImplCopyWithImpl(
      _$AddExpenseImpl _value, $Res Function(_$AddExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? amount = null,
    Object? notes = null,
    Object? dateTime = null,
  }) {
    return _then(_$AddExpenseImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddExpenseImpl with DiagnosticableTreeMixin implements AddExpense {
  const _$AddExpenseImpl(
      {required this.categoryId,
      required this.amount,
      required this.notes,
      required this.dateTime});

  @override
  final int categoryId;
  @override
  final double amount;
  @override
  final String notes;
  @override
  final DateTime dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.addExpense(categoryId: $categoryId, amount: $amount, notes: $notes, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.addExpense'))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddExpenseImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, amount, notes, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddExpenseImplCopyWith<_$AddExpenseImpl> get copyWith =>
      __$$AddExpenseImplCopyWithImpl<_$AddExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return addExpense(categoryId, amount, notes, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return addExpense?.call(categoryId, amount, notes, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(categoryId, amount, notes, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return addExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return addExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (addExpense != null) {
      return addExpense(this);
    }
    return orElse();
  }
}

abstract class AddExpense implements ExpenseTrackerEvent {
  const factory AddExpense(
      {required final int categoryId,
      required final double amount,
      required final String notes,
      required final DateTime dateTime}) = _$AddExpenseImpl;

  int get categoryId;
  double get amount;
  String get notes;
  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$AddExpenseImplCopyWith<_$AddExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetExpensesImplCopyWith<$Res> {
  factory _$$GetExpensesImplCopyWith(
          _$GetExpensesImpl value, $Res Function(_$GetExpensesImpl) then) =
      __$$GetExpensesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? fromDt, DateTime? toDt});
}

/// @nodoc
class __$$GetExpensesImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$GetExpensesImpl>
    implements _$$GetExpensesImplCopyWith<$Res> {
  __$$GetExpensesImplCopyWithImpl(
      _$GetExpensesImpl _value, $Res Function(_$GetExpensesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromDt = freezed,
    Object? toDt = freezed,
  }) {
    return _then(_$GetExpensesImpl(
      fromDt: freezed == fromDt
          ? _value.fromDt
          : fromDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDt: freezed == toDt
          ? _value.toDt
          : toDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$GetExpensesImpl with DiagnosticableTreeMixin implements GetExpenses {
  const _$GetExpensesImpl({this.fromDt, this.toDt});

  @override
  final DateTime? fromDt;
  @override
  final DateTime? toDt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.getExpenses(fromDt: $fromDt, toDt: $toDt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.getExpenses'))
      ..add(DiagnosticsProperty('fromDt', fromDt))
      ..add(DiagnosticsProperty('toDt', toDt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExpensesImpl &&
            (identical(other.fromDt, fromDt) || other.fromDt == fromDt) &&
            (identical(other.toDt, toDt) || other.toDt == toDt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromDt, toDt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExpensesImplCopyWith<_$GetExpensesImpl> get copyWith =>
      __$$GetExpensesImplCopyWithImpl<_$GetExpensesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return getExpenses(fromDt, toDt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return getExpenses?.call(fromDt, toDt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (getExpenses != null) {
      return getExpenses(fromDt, toDt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return getExpenses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return getExpenses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (getExpenses != null) {
      return getExpenses(this);
    }
    return orElse();
  }
}

abstract class GetExpenses implements ExpenseTrackerEvent {
  const factory GetExpenses({final DateTime? fromDt, final DateTime? toDt}) =
      _$GetExpensesImpl;

  DateTime? get fromDt;
  DateTime? get toDt;
  @JsonKey(ignore: true)
  _$$GetExpensesImplCopyWith<_$GetExpensesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditExpenseImplCopyWith<$Res> {
  factory _$$EditExpenseImplCopyWith(
          _$EditExpenseImpl value, $Res Function(_$EditExpenseImpl) then) =
      __$$EditExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Expense expense});

  $ExpenseCopyWith<$Res> get expense;
}

/// @nodoc
class __$$EditExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$EditExpenseImpl>
    implements _$$EditExpenseImplCopyWith<$Res> {
  __$$EditExpenseImplCopyWithImpl(
      _$EditExpenseImpl _value, $Res Function(_$EditExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = null,
  }) {
    return _then(_$EditExpenseImpl(
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as Expense,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res> get expense {
    return $ExpenseCopyWith<$Res>(_value.expense, (value) {
      return _then(_value.copyWith(expense: value));
    });
  }
}

/// @nodoc

class _$EditExpenseImpl with DiagnosticableTreeMixin implements EditExpense {
  const _$EditExpenseImpl({required this.expense});

  @override
  final Expense expense;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.editExpense(expense: $expense)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.editExpense'))
      ..add(DiagnosticsProperty('expense', expense));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditExpenseImpl &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditExpenseImplCopyWith<_$EditExpenseImpl> get copyWith =>
      __$$EditExpenseImplCopyWithImpl<_$EditExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return editExpense(expense);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return editExpense?.call(expense);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(expense);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return editExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return editExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (editExpense != null) {
      return editExpense(this);
    }
    return orElse();
  }
}

abstract class EditExpense implements ExpenseTrackerEvent {
  const factory EditExpense({required final Expense expense}) =
      _$EditExpenseImpl;

  Expense get expense;
  @JsonKey(ignore: true)
  _$$EditExpenseImplCopyWith<_$EditExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteExpenseImplCopyWith<$Res> {
  factory _$$DeleteExpenseImplCopyWith(
          _$DeleteExpenseImpl value, $Res Function(_$DeleteExpenseImpl) then) =
      __$$DeleteExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$DeleteExpenseImpl>
    implements _$$DeleteExpenseImplCopyWith<$Res> {
  __$$DeleteExpenseImplCopyWithImpl(
      _$DeleteExpenseImpl _value, $Res Function(_$DeleteExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteExpenseImpl
    with DiagnosticableTreeMixin
    implements DeleteExpense {
  const _$DeleteExpenseImpl({required this.id});

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.deleteExpense(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.deleteExpense'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteExpenseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      __$$DeleteExpenseImplCopyWithImpl<_$DeleteExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return deleteExpense(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return deleteExpense?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return deleteExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return deleteExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(this);
    }
    return orElse();
  }
}

abstract class DeleteExpense implements ExpenseTrackerEvent {
  const factory DeleteExpense({required final int id}) = _$DeleteExpenseImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChartDataImplCopyWith<$Res> {
  factory _$$GetChartDataImplCopyWith(
          _$GetChartDataImpl value, $Res Function(_$GetChartDataImpl) then) =
      __$$GetChartDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryType categoryType, DateTime? fromDt, DateTime? toDate});
}

/// @nodoc
class __$$GetChartDataImplCopyWithImpl<$Res>
    extends _$ExpenseTrackerEventCopyWithImpl<$Res, _$GetChartDataImpl>
    implements _$$GetChartDataImplCopyWith<$Res> {
  __$$GetChartDataImplCopyWithImpl(
      _$GetChartDataImpl _value, $Res Function(_$GetChartDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? fromDt = freezed,
    Object? toDate = freezed,
  }) {
    return _then(_$GetChartDataImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      fromDt: freezed == fromDt
          ? _value.fromDt
          : fromDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$GetChartDataImpl with DiagnosticableTreeMixin implements GetChartData {
  const _$GetChartDataImpl(
      {required this.categoryType, this.fromDt, this.toDate});

  @override
  final CategoryType categoryType;
  @override
  final DateTime? fromDt;
  @override
  final DateTime? toDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseTrackerEvent.getChartData(categoryType: $categoryType, fromDt: $fromDt, toDate: $toDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseTrackerEvent.getChartData'))
      ..add(DiagnosticsProperty('categoryType', categoryType))
      ..add(DiagnosticsProperty('fromDt', fromDt))
      ..add(DiagnosticsProperty('toDate', toDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChartDataImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.fromDt, fromDt) || other.fromDt == fromDt) &&
            (identical(other.toDate, toDate) || other.toDate == toDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryType, fromDt, toDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChartDataImplCopyWith<_$GetChartDataImpl> get copyWith =>
      __$$GetChartDataImplCopyWithImpl<_$GetChartDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryType categoryType) feachCategories,
    required TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)
        addExpense,
    required TResult Function(DateTime? fromDt, DateTime? toDt) getExpenses,
    required TResult Function(Expense expense) editExpense,
    required TResult Function(int id) deleteExpense,
    required TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)
        getChartData,
  }) {
    return getChartData(categoryType, fromDt, toDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CategoryType categoryType)? feachCategories,
    TResult? Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult? Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult? Function(Expense expense)? editExpense,
    TResult? Function(int id)? deleteExpense,
    TResult? Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
  }) {
    return getChartData?.call(categoryType, fromDt, toDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryType categoryType)? feachCategories,
    TResult Function(
            int categoryId, double amount, String notes, DateTime dateTime)?
        addExpense,
    TResult Function(DateTime? fromDt, DateTime? toDt)? getExpenses,
    TResult Function(Expense expense)? editExpense,
    TResult Function(int id)? deleteExpense,
    TResult Function(
            CategoryType categoryType, DateTime? fromDt, DateTime? toDate)?
        getChartData,
    required TResult orElse(),
  }) {
    if (getChartData != null) {
      return getChartData(categoryType, fromDt, toDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeachCategories value) feachCategories,
    required TResult Function(AddExpense value) addExpense,
    required TResult Function(GetExpenses value) getExpenses,
    required TResult Function(EditExpense value) editExpense,
    required TResult Function(DeleteExpense value) deleteExpense,
    required TResult Function(GetChartData value) getChartData,
  }) {
    return getChartData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeachCategories value)? feachCategories,
    TResult? Function(AddExpense value)? addExpense,
    TResult? Function(GetExpenses value)? getExpenses,
    TResult? Function(EditExpense value)? editExpense,
    TResult? Function(DeleteExpense value)? deleteExpense,
    TResult? Function(GetChartData value)? getChartData,
  }) {
    return getChartData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeachCategories value)? feachCategories,
    TResult Function(AddExpense value)? addExpense,
    TResult Function(GetExpenses value)? getExpenses,
    TResult Function(EditExpense value)? editExpense,
    TResult Function(DeleteExpense value)? deleteExpense,
    TResult Function(GetChartData value)? getChartData,
    required TResult orElse(),
  }) {
    if (getChartData != null) {
      return getChartData(this);
    }
    return orElse();
  }
}

abstract class GetChartData implements ExpenseTrackerEvent {
  const factory GetChartData(
      {required final CategoryType categoryType,
      final DateTime? fromDt,
      final DateTime? toDate}) = _$GetChartDataImpl;

  CategoryType get categoryType;
  DateTime? get fromDt;
  DateTime? get toDate;
  @JsonKey(ignore: true)
  _$$GetChartDataImplCopyWith<_$GetChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
