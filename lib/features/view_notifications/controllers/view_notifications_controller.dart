import 'package:get/get.dart';

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String timeAgo;
  final String iconType; // bell, calendar, trend, bulb, target, chat
  final String backgroundColor;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.iconType,
    required this.backgroundColor,
    this.isRead = false,
  });
}

class ViewNotificationsController extends GetxController {
  final notifications = <NotificationModel>[
    NotificationModel(
      id: '1',
      title: 'Practice Reminder',
      description: 'Time to practice your interview skills',
      timeAgo: '1h ago',
      iconType: 'bell',
      backgroundColor: '0x26A896E6',
    ),
    NotificationModel(
      id: '2',
      title: 'Practice Reminder',
      description: 'Time to practice your interview skills',
      timeAgo: '1h ago',
      iconType: 'calendar',
      backgroundColor: '0x4CB8D4F1',
    ),
    NotificationModel(
      id: '3',
      title: 'Weekly Progress',
      description: 'You improved your score by 5%',
      timeAgo: '2 days ago',
      iconType: 'trend',
      backgroundColor: '0x3FB8E6D5',
    ),
    NotificationModel(
      id: '4',
      title: 'Pro Tip',
      description: 'Use the STAR method for behavioral questions',
      timeAgo: '3 days ago',
      iconType: 'bulb',
      backgroundColor: '0x4CE6D4F1',
    ),
    NotificationModel(
      id: '5',
      title: 'Session Completed',
      description: 'Great job on Behavioral Interview practice!',
      timeAgo: '4 days ago',
      iconType: 'target',
      backgroundColor: '0x26A896E6',
    ),
    NotificationModel(
      id: '6',
      title: 'New Feedback Available',
      description: 'Check out your performance review',
      timeAgo: '5 days ago',
      iconType: 'chat',
      backgroundColor: '0x4CB8D4F1',
    ),
  ].obs;

  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    notifications.refresh();
  }

  void markAsRead(String notificationId) {
    final index = notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      notifications[index].isRead = true;
      notifications.refresh();
    }
  }
}
