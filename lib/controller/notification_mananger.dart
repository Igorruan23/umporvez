import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    var initializationSettingAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
     
      importance: Importance.high,
      priority: Priority.high,
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Nova Motivação',
      'Nova motivação a caminho!',
      platformChannelSpecifics,
    );
  }
}

final notificationManager = NotificationManager();