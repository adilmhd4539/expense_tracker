import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:expense_tracker/core/handlers/local_notification/local_notification_services.dart';
import 'package:sqflite/sqflite.dart';

import '../models/notification_model.dart';

abstract class SettingsLocalDataSource {
  Future<NotificationModel> getNotification();
  Future<NotificationModel> updateNotification(
      {required NotificationModel notification});
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final Database _db;

  SettingsLocalDataSourceImpl({required Database db}) : _db = db;
  @override
  Future<NotificationModel> getNotification() async {
    try {
      return await _db
          .query(DbServices.notificationTable)
          .then((value) => NotificationModel.fromJson(value[0]));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NotificationModel> updateNotification(
      {required NotificationModel notification}) async {
    try {
      await _db.update(DbServices.notificationTable, notification.toJson(),
          where: 'id=?', whereArgs: [notification.id]);

      await LocalNotificationServices.flutterLocalNotificationsPlugin
          .cancel(notification.id);
      await LocalNotificationServices.sheduleNotificationDaily(
          id: notification.id,
          title: notification.title,
          body: notification.body,
          date: DateTime.parse(notification.date));
      return await _db.query(DbServices.notificationTable,
          where: 'id=?',
          whereArgs: [
            notification.id
          ]).then((value) => NotificationModel.fromJson(value[0]));
    } catch (e) {
      rethrow;
    }
  }
}
