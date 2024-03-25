import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/notification_entity.freezed.dart';
part 'generated/notification_entity.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
