// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/notification_model.g.dart';
part 'generated/notification_model.freezed.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'date') required String date,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
