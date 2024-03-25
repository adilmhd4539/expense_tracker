// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../chart_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartDataImpl _$$ChartDataImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataImpl(
      totalAmout: (json['total_amout'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChartDataImplToJson(_$ChartDataImpl instance) =>
    <String, dynamic>{
      'total_amout': instance.totalAmout,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
