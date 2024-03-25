import 'package:flutter/material.dart';

import 'core/handlers/di/service_locator.dart';
import 'features/app/app.dart';

void main() async {
  await registerServiceLocatior();
  runApp(const MyApp());
}
