import 'package:expense_tracker/core/handlers/local_notification/local_notification_services.dart';
import 'package:flutter/material.dart';

import 'core/handlers/di/service_locator.dart';
import 'features/app/app.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await registerServiceLocatior();
  tz.initializeTimeZones();
  await LocalNotificationServices.initializeNotification();
  runApp(const MyApp());
}
