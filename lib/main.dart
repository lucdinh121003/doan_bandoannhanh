import 'dart:convert';

import 'package:doan_bandoannhanh/firebase_options.dart';
import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:doan_bandoannhanh/pages/home_page.dart';
import 'package:doan_bandoannhanh/services/auth/auth_gate.dart';
import 'package:doan_bandoannhanh/services/notification/notification_service.dart';
import 'package:doan_bandoannhanh/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received in background...");
  }
}
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

  // khởi tạo tin nhắn firebase
  await PushNotifications.init();

  // khởi tạo thông báo cục bộ
  await PushNotifications.localNotiInit();

  // Nghe thông báo nền
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  
  // Thông báo trên ứng dụng
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Background Notification Tapped");
      navigatorKey.currentState!.pushNamed("/home");
    }
  });

  // Thông báo khi ứng dụng đang chạy
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("Got a message in foreground");
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(title: message.notification!.title!, body: message.notification!.body!, payload: payloadData);
    }
  });

  // Lấy thông báo khi ứng dụng bị tắt
  final RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    print("Launched from terminated state");
    Future.delayed(Duration(seconds: 1), () {
      navigatorKey.currentState!.pushNamed("/home");
    });
  }
  runApp(
   MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      
      ChangeNotifierProvider(create: (context) => Restaurant()),
      
    ],
    child: const MyApp(),
   ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home:  const AuthGate(
      ),
      theme:  Provider.of<ThemeProvider>(context).themeData,
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
      },
    );
  }
}