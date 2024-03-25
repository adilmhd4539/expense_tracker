import 'dart:developer';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationServices {
  static Future<bool> requestPermission() async {
    bool isPermissionAllowed = false;
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      isPermissionAllowed = granted;
    }
    if (!isPermissionAllowed) {
      if (Platform.isIOS || Platform.isMacOS) {
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                MacOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      } else if (Platform.isAndroid) {
        final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
            flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>();

        final bool? grantedNotificationPermission =
            await androidImplementation?.requestNotificationsPermission();
        isPermissionAllowed = grantedNotificationPermission ?? false;
      }
    }
    return isPermissionAllowed;
  }

  static DarwinInitializationSettings darwinInitializationSettings =
      const DarwinInitializationSettings();
  static const androidChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'high_importance_channel',
    importance: Importance.max,
    playSound: true,
    enableVibration: true,
    showBadge: true,
  );
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('app_icon');
  static Future<void> initializeNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    final bool isPermmissionGaint = await requestPermission();
    if (isPermmissionGaint) {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );
      final List<PendingNotificationRequest> pendingList =
          await flutterLocalNotificationsPlugin.pendingNotificationRequests();

      if (pendingList.isEmpty) {
        await sheduleNotificationDaily(
            id: 1,
            title: 'Daily expense reminder',
            body: 'its time to update your expenses now',
            date: DateTime(9999, 1, 1, 20));
      }
    }
  }

  static Future<void> sheduleNotificationDaily(
      {required int id,
      required String title,
      required String body,
      required DateTime date}) async {
    return await flutterLocalNotificationsPlugin
        .zonedSchedule(
            id,
            title,
            body,
            getSheduleDate(date),
            NotificationDetails(
                android: AndroidNotificationDetails(
                  androidChannel.id,
                  androidChannel.name,
                  playSound: true,
                  priority: Priority.max,
                  importance: Importance.max,
                ),
                iOS: const DarwinNotificationDetails(
                  presentAlert: true,
                  presentSound: true,
                  presentBadge: true,
                )),
            matchDateTimeComponents: DateTimeComponents.time,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime)
        .catchError((e) {
      log(e.toString());
    });
  }

  static tz.TZDateTime getSheduleDate(DateTime time) {
    DateTime currentDate = DateTime.now();
    DateTime sheduledDateTime = DateTime(currentDate.year, currentDate.month,
        currentDate.day, time.hour, time.minute, time.second);
    final sheduleDate = tz.TZDateTime.from(sheduledDateTime, tz.local);

    return sheduleDate.isBefore(currentDate)
        ? sheduleDate.add(const Duration(days: 1))
        : sheduleDate;
  }
}
