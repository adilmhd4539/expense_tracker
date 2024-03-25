// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../expense_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseDataImpl _$$ExpenseDataImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseDataImpl(
      expenseList: (json['expense_list'] as List<dynamic>)
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalIncome: (json['total_income'] as num).toDouble(),
      balace: (json['balace'] as num).toDouble(),
      totalExpense: (json['total_expense'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExpenseDataImplToJson(_$ExpenseDataImpl instance) =>
    <String, dynamic>{
      'expense_list': instance.expenseList.map((e) => e.toJson()).toList(),
      'total_income': instance.totalIncome,
      'balace': instance.balace,
      'total_expense': instance.totalExpense,
    };
