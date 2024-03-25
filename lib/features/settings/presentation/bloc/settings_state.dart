import 'package:expense_tracker/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entites/notification_entity.dart';

part 'generated/settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = Initial;
  const factory SettingsState.gettingNotification() = GettingNotification;
  const factory SettingsState.gettingNotificationFailed(
      {required Failure failure}) = GettingNotificationFailed;
  const factory SettingsState.gettingNotificationSuccess(
      {required Notification notificaton}) = GettingNotificationSucess;
  const factory SettingsState.updatingNotification() = UpdatingNotification;
  const factory SettingsState.updatingNotificationFailure(
          {required Failure failure,
          required Notification excistingNotification}) =
      UpdatingNotificationFailure;
  const factory SettingsState.updatingNotificationSuccess(
      Notification notification) = UpdatingNotificationSuccess;
}
