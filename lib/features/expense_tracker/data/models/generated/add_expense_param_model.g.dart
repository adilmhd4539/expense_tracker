// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../add_expense_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddExpenseParamModelImpl _$$AddExpenseParamModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddExpenseParamModelImpl(
      amount: (json['amount'] as num).toDouble(),
      idCategory: json['id_category'] as int,
      notes: json['notes'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$AddExpenseParamModelImplToJson(
        _$AddExpenseParamModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id_category': instance.idCategory,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
    };
