import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/settings/domain/entites/notification_entity.dart';
import 'package:expense_tracker/features/settings/presentation/bloc/settings_event.dart';
import 'package:expense_tracker/resorses/app_textstyles.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/settings_bloc.dart';
import '../bloc/settings_state.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    _fetchNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User preferences'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return state.maybeMap(
            updatingNotificationSuccess: (value) =>
                _buildBody(notification: value.notification),
            updatingNotificationFailure: (value) =>
                _buildBody(notification: value.excistingNotification),
            gettingNotificationSuccess: (value) =>
                _buildBody(notification: value.notificaton),
            gettingNotificationFailed: (value) => Center(
              child: Text(Failure.getErrorMessage(value.failure)),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody({required Notification notification}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Notify me every day to add my expense on',
            style: AppTextStyles.largeSemiBold,
          ),
          Text(
            DateFormat('hh:mm a').format(
              notification.date,
            ),
            style: AppTextStyles.title,
          ),
          TextButton(
              onPressed: () {
                _handleOnEdit(notification: notification);
              },
              child: const Text('Edit'))
        ],
      ),
    );
  }

  void _fetchNotification() {
    context.read<SettingsBloc>().add(const GetNotification());
  }

  void _handleOnEdit({required Notification notification}) async {
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: notification.date.hour, minute: notification.date.minute));
    if (selectedTime != null && mounted) {
      context.read<SettingsBloc>().add(UpdateNotification(
          notification: notification.copyWith(
              date: DateTime(
                  notification.date.year,
                  notification.date.month,
                  notification.date.day,
                  selectedTime.hour,
                  selectedTime.minute)),
          currentNotification: notification));
    }
  }
}
