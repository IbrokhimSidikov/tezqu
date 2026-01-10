import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(notifications: []));

  void addNotification(NotificationEntity notification) {
    final updatedNotifications = [notification, ...state.notifications];
    emit(state.copyWith(notifications: updatedNotifications));
  }

  void markAsRead(String notificationId) {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();
    emit(state.copyWith(notifications: updatedNotifications));
  }

  void clearAll() {
    emit(state.copyWith(notifications: []));
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
