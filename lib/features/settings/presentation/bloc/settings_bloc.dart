import 'dart:async';

import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:expense_tracker/features/settings/domain/usecases/settings_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsUsecase _usecase;
  final AppRouter _router;
  SettingsBloc(this._usecase, this._router) : super(const Initial()) {
    on<GetNotification>(_handleOnGetNotification);
    on<UpdateNotification>(_handleOnUpdateNotification);
  }

  FutureOr<void> _handleOnGetNotification(
      GetNotification event, Emitter<SettingsState> emit) async {
    emit(const GettingNotification());
    final result = await _usecase.getNotification();
    result.fold(
        (error) => emit(GettingNotificationFailed(failure: error)),
        (notification) =>
            emit(GettingNotificationSucess(notificaton: notification)));
  }

  FutureOr<void> _handleOnUpdateNotification(
      UpdateNotification event, Emitter<SettingsState> emit) async {
    emit(const UpdatingNotification());
    final result =
        await _usecase.updateNotification(notification: event.notification);
    result.fold((error) {
      _handleOnUpdaingFailed(Failure.getErrorMessage(error));
      emit(UpdatingNotificationFailure(
          failure: error, excistingNotification: event.currentNotification));
    },
        (successNotification) =>
            emit(UpdatingNotificationSuccess(successNotification)));
  }

  void _handleOnUpdaingFailed(String message) {
    ScaffoldMessenger.of(_router.navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(_router.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
