// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../expense_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as int,
      amount: (json['amount'] as num).toDouble(),
      notes: json['notes'] as String,
      date: DateTime.parse(json['date'] as String),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'notes': instance.notes,
      'date': instance.date.toIso8601String(),
      'category': instance.category.toJson(),
    };
