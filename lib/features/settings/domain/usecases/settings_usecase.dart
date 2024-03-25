import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/settings/domain/repository/settings_repository.dart';

import '../entites/notification_entity.dart';

class SettingsUsecase {
  final SettingsRepository _repository;
  SettingsUsecase(SettingsRepository repo) : _repository = repo;
  Future<Either<Failure, Notification>> getNotification() async {
    return await _repository.getNotification();
  }

  Future<Either<Failure, Notification>> updateNotification(
      {required Notification notification}) async {
    return await _repository.updateNotification(notification: notification);
  }
}
