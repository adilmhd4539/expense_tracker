import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';

import '../entites/notification_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Notification>> getNotification();
  Future<Either<Failure, Notification>> updateNotification(
      {required Notification notification});
}
