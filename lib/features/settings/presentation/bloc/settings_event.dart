import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entites/notification_entity.dart';

part 'generated/settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.getNotification() = GetNotification;
  const factory SettingsEvent.updateNotification(
      {required Notification notification,
      required Notification currentNotification}) = UpdateNotification;
}
