import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(notifications: []));

  void addNotification(NotificationEntity notification) {
    // Check if notification already exists to prevent duplicates
    final existingIds = state.notifications.map((n) => n.id).toSet();
    if (existingIds.contains(notification.id)) {
      return;
    }
    
    final updatedNotifications = [notification, ...state.notifications];
    emit(state.copyWith(notifications: updatedNotifications));
  }

  Future<void> markAsRead(String notificationId) async {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();
    emit(state.copyWith(notifications: updatedNotifications));
    
    // Persist to SharedPreferences
    await _saveNotificationsToStorage(updatedNotifications);
  }

  Future<void> clearAll() async {
    emit(state.copyWith(notifications: []));
    
    // Clear from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_notifications');
  }

  Future<void> _saveNotificationsToStorage(List<NotificationEntity> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    final notificationJsonList = notifications.map((notification) {
      return jsonEncode({
        'id': notification.id,
        'title': notification.title,
        'body': notification.body,
        'data': jsonEncode(notification.data),
        'timestamp': notification.timestamp.toIso8601String(),
        'isRead': notification.isRead,
      });
    }).toList();
    await prefs.setStringList('saved_notifications', notificationJsonList);
  }

  int get unreadCount => state.notifications.where((n) => !n.isRead).length;
}

class NotificationState {
  final List<NotificationEntity> notifications;

  NotificationState({required this.notifications});

  NotificationState copyWith({List<NotificationEntity>? notifications}) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }
}
