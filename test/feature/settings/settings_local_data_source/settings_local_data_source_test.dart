import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:expense_tracker/features/settings/data/local_data_soource/settings_local_data_soource.dart';
import 'package:expense_tracker/features/settings/data/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:timezone/timezone.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() {
  late SettingsLocalDataSource localDataSource;
  final NotificationModel initialNotification = NotificationModel(
      id: 1,
      title: 'Daily expense reminder',
      body: 'its time to update your expenses now',
      date: DateTime(
        9999,
        1,
        1,
        20,
      ).toIso8601String());
  sqfliteTestInit();
  test('test get notification ', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        ' CREATE TABLE ${DbServices.notificationTable} ( id integer PRIMARY KEY AUTOINCREMENT ,title TEXT NOT NULL ,body TEXT NOT NULL ,date TEXT NOT NULL);');
    localDataSource = SettingsLocalDataSourceImpl(db: db);
    await db.insert(DbServices.notificationTable, initialNotification.toJson());
    await localDataSource.getNotification().then((value) {
      expect(value, isA<NotificationModel>());
      expect(value.id, 1);
      expect(value.title, 'Daily expense reminder');
      expect(value.body, 'its time to update your expenses now');
      expect(
          value.date,
          DateTime(
            9999,
            1,
            1,
            20,
          ).toIso8601String());
    });
  });
}
