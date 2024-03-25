// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryId: json['category_id'] as int,
      categoryName: json['category_name'] as String,
      categoryType: $enumDecode(_$CategoryTypeEnumMap, json['category_type']),
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_type': _$CategoryTypeEnumMap[instance.categoryType]!,
      'total_amount': instance.totalAmount,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.income: 'INCOME',
  CategoryType.expense: 'EXPENSE',
};
