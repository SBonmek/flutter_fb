import 'package:firebase_messaging/firebase_messaging.dart';

Future _backgroundMessage(RemoteMessage remoteMessage) async {
  print("backgroundMessage");
}

class MessagingConsole {
  initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onBackgroundMessage(_backgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage){
      print("onMessage");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage){
      print("onMessageOpenedApp");

    });
  }
}
