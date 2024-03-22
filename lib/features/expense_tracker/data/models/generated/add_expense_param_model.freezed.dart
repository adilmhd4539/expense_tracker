// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../add_expense_param_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddExpenseParamModel _$AddExpenseParamModelFromJson(Map<String, dynamic> json) {
  return _AddExpenseParamModel.fromJson(json);
}

/// @nodoc
mixin _$AddExpenseParamModel {
  @JsonKey(name: "amount")
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "id_category")
  int get idCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "notes")
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddExpenseParamModelCopyWith<AddExpenseParamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddExpenseParamModelCopyWith<$Res> {
  factory $AddExpenseParamModelCopyWith(AddExpenseParamModel value,
          $Res Function(AddExpenseParamModel) then) =
      _$AddExpenseParamModelCopyWithImpl<$Res, AddExpenseParamModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "amount") double amount,
      @JsonKey(name: "id_category") int idCategory,
      @JsonKey(name: "notes") String notes,
      @JsonKey(name: "date") DateTime date});
}

/// @nodoc
class _$AddExpenseParamModelCopyWithImpl<$Res,
        $Val extends AddExpenseParamModel>
    implements $AddExpenseParamModelCopyWith<$Res> {
  _$AddExpenseParamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? idCategory = null,
    Object? notes = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddExpenseParamModelImplCopyWith<$Res>
    implements $AddExpenseParamModelCopyWith<$Res> {
  factory _$$AddExpenseParamModelImplCopyWith(_$AddExpenseParamModelImpl value,
          $Res Function(_$AddExpenseParamModelImpl) then) =
      __$$AddExpenseParamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "amount") double amount,
      @JsonKey(name: "id_category") int idCategory,
      @JsonKey(name: "notes") String notes,
      @JsonKey(name: "date") DateTime date});
}

/// @nodoc
class __$$AddExpenseParamModelImplCopyWithImpl<$Res>
    extends _$AddExpenseParamModelCopyWithImpl<$Res, _$AddExpenseParamModelImpl>
    implements _$$AddExpenseParamModelImplCopyWith<$Res> {
  __$$AddExpenseParamModelImplCopyWithImpl(_$AddExpenseParamModelImpl _value,
      $Res Function(_$AddExpenseParamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? idCategory = null,
    Object? notes = null,
    Object? date = null,
  }) {
    return _then(_$AddExpenseParamModelImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddExpenseParamModelImpl implements _AddExpenseParamModel {
  const _$AddExpenseParamModelImpl(
      {@JsonKey(name: "amount") required this.amount,
      @JsonKey(name: "id_category") required this.idCategory,
      @JsonKey(name: "notes") required this.notes,
      @JsonKey(name: "date") required this.date});

  factory _$AddExpenseParamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddExpenseParamModelImplFromJson(json);

  @override
  @JsonKey(name: "amount")
  final double amount;
  @override
  @JsonKey(name: "id_category")
  final int idCategory;
  @override
  @JsonKey(name: "notes")
  final String notes;
  @override
  @JsonKey(name: "date")
  final DateTime date;

  @override
  String toString() {
    return 'AddExpenseParamModel(amount: $amount, idCategory: $idCategory, notes: $notes, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddExpenseParamModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, idCategory, notes, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddExpenseParamModelImplCopyWith<_$AddExpenseParamModelImpl>
      get copyWith =>
          __$$AddExpenseParamModelImplCopyWithImpl<_$AddExpenseParamModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddExpenseParamModelImplToJson(
      this,
    );
  }
}

abstract class _AddExpenseParamModel implements AddExpenseParamModel {
  const factory _AddExpenseParamModel(
          {@JsonKey(name: "amount") required final double amount,
          @JsonKey(name: "id_category") required final int idCategory,
          @JsonKey(name: "notes") required final String notes,
          @JsonKey(name: "date") required final DateTime date}) =
      _$AddExpenseParamModelImpl;

  factory _AddExpenseParamModel.fromJson(Map<String, dynamic> json) =
      _$AddExpenseParamModelImpl.fromJson;

  @override
  @JsonKey(name: "amount")
  double get amount;
  @override
  @JsonKey(name: "id_category")
  int get idCategory;
  @override
  @JsonKey(name: "notes")
  String get notes;
  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$AddExpenseParamModelImplCopyWith<_$AddExpenseParamModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
