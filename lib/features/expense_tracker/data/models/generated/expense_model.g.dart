// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as int,
      amount: (json['amount'] as num).toDouble(),
      idCategory: json['id_category '] as int,
      categoryName: json['category_name'] as String,
      categoryType: $enumDecode(_$CategoryTypeEnumMap, json['category_type']),
      notes: json['notes'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'id_category ': instance.idCategory,
      'category_name': instance.categoryName,
      'category_type': _$CategoryTypeEnumMap[instance.categoryType]!,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
    };

const _$CategoryTypeEnumMap = {
  CategoryType.income: 'INCOME',
  CategoryType.expense: 'EXPENSE',
};
