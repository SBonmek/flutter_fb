import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future _backgroundMessage(RemoteMessage remoteMessage) async {
  print("backgroundMessage");
}

class MessagingConsole {
  initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            "ffb",
            "Flutterfb",
            importance: Importance.high,
          ),
        );

    FirebaseMessaging.onBackgroundMessage(_backgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print("onMessage");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      print("onMessageOpenedApp");
    });
  }
}
