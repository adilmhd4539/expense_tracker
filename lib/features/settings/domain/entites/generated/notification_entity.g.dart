// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date.toIso8601String(),
    };
