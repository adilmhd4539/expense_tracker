// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../expense_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseData _$ExpenseDataFromJson(Map<String, dynamic> json) {
  return _ExpenseData.fromJson(json);
}

/// @nodoc
mixin _$ExpenseData {
  List<Expense> get expenseList => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get balace => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseDataCopyWith<ExpenseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDataCopyWith<$Res> {
  factory $ExpenseDataCopyWith(
          ExpenseData value, $Res Function(ExpenseData) then) =
      _$ExpenseDataCopyWithImpl<$Res, ExpenseData>;
  @useResult
  $Res call(
      {List<Expense> expenseList,
      double totalIncome,
      double balace,
      double totalExpense});
}

/// @nodoc
class _$ExpenseDataCopyWithImpl<$Res, $Val extends ExpenseData>
    implements $ExpenseDataCopyWith<$Res> {
  _$ExpenseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseList = null,
    Object? totalIncome = null,
    Object? balace = null,
    Object? totalExpense = null,
  }) {
    return _then(_value.copyWith(
      expenseList: null == expenseList
          ? _value.expenseList
          : expenseList // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      balace: null == balace
          ? _value.balace
          : balace // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseDataImplCopyWith<$Res>
    implements $ExpenseDataCopyWith<$Res> {
  factory _$$ExpenseDataImplCopyWith(
          _$ExpenseDataImpl value, $Res Function(_$ExpenseDataImpl) then) =
      __$$ExpenseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Expense> expenseList,
      double totalIncome,
      double balace,
      double totalExpense});
}

/// @nodoc
class __$$ExpenseDataImplCopyWithImpl<$Res>
    extends _$ExpenseDataCopyWithImpl<$Res, _$ExpenseDataImpl>
    implements _$$ExpenseDataImplCopyWith<$Res> {
  __$$ExpenseDataImplCopyWithImpl(
      _$ExpenseDataImpl _value, $Res Function(_$ExpenseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseList = null,
    Object? totalIncome = null,
    Object? balace = null,
    Object? totalExpense = null,
  }) {
    return _then(_$ExpenseDataImpl(
      expenseList: null == expenseList
          ? _value._expenseList
          : expenseList // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      balace: null == balace
          ? _value.balace
          : balace // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseDataImpl implements _ExpenseData {
  const _$ExpenseDataImpl(
      {required final List<Expense> expenseList,
      required this.totalIncome,
      required this.balace,
      required this.totalExpense})
      : _expenseList = expenseList;

  factory _$ExpenseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseDataImplFromJson(json);

  final List<Expense> _expenseList;
  @override
  List<Expense> get expenseList {
    if (_expenseList is EqualUnmodifiableListView) return _expenseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseList);
  }

  @override
  final double totalIncome;
  @override
  final double balace;
  @override
  final double totalExpense;

  @override
  String toString() {
    return 'ExpenseData(expenseList: $expenseList, totalIncome: $totalIncome, balace: $balace, totalExpense: $totalExpense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseDataImpl &&
            const DeepCollectionEquality()
                .equals(other._expenseList, _expenseList) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.balace, balace) || other.balace == balace) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenseList),
      totalIncome,
      balace,
      totalExpense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseDataImplCopyWith<_$ExpenseDataImpl> get copyWith =>
      __$$ExpenseDataImplCopyWithImpl<_$ExpenseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseDataImplToJson(
      this,
    );
  }
}

abstract class _ExpenseData implements ExpenseData {
  const factory _ExpenseData(
      {required final List<Expense> expenseList,
      required final double totalIncome,
      required final double balace,
      required final double totalExpense}) = _$ExpenseDataImpl;

  factory _ExpenseData.fromJson(Map<String, dynamic> json) =
      _$ExpenseDataImpl.fromJson;

  @override
  List<Expense> get expenseList;
  @override
  double get totalIncome;
  @override
  double get balace;
  @override
  double get totalExpense;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseDataImplCopyWith<_$ExpenseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
