// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../add_expense_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddExpenseParamModelImpl _$$AddExpenseParamModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddExpenseParamModelImpl(
      amount: (json['amount'] as num).toDouble(),
      idCategory: json['category_id'] as int,
      notes: json['notes'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$AddExpenseParamModelImplToJson(
        _$AddExpenseParamModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'category_id': instance.idCategory,
      'notes': instance.notes,
      'date': instance.date,
    };
