import 'package:dartz/dartz.dart';

import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/settings/data/local_data_soource/settings_local_data_soource.dart';
import 'package:expense_tracker/features/settings/data/models/notification_model.dart';

import 'package:expense_tracker/features/settings/domain/entites/notification_entity.dart';

import '../../domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;

  SettingsRepositoryImpl({required SettingsLocalDataSource localDataSource})
      : _localDataSource = localDataSource;
  @override
  Future<Either<Failure, Notification>> getNotification() async {
    try {
      final result = await _localDataSource.getNotification();
      return Right(Notification(
          id: result.id,
          title: result.title,
          body: result.body,
          date: DateTime.parse(result.date)));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, Notification>> updateNotification(
      {required Notification notification}) async {
    try {
      final result = await _localDataSource.updateNotification(
          notification: NotificationModel(
              id: notification.id,
              title: notification.title,
              body: notification.body,
              date: notification.date.toIso8601String()));
      return Right(Notification(
          id: result.id,
          title: result.title,
          body: result.body,
          date: DateTime.parse(result.date)));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }
}
