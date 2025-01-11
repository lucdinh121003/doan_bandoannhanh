

// ignore_for_file: prefer_const_constructors, avoid_print, avoid_returning_null_for_void

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';
import 'crud_service.dart';
import '../auth/auth_service.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  // nhận mã thông báo thiết bị fcm
  static Future getDeviceToken({int maxRetires = 3}) async {
    try {
      // nhận mã thông báo fcm của thiết bị
      final String? token = await _firebaseMessaging.getToken();
      print("for android device token: $token");
      saveTokenToFirestore(token: token!);
      return token;
    } catch (e) {
      print("failed to get device token");
      if (maxRetires > 0) {
        print("try after 10 sec");
        await Future.delayed(Duration(seconds: 10));
        return getDeviceToken(maxRetires: maxRetires - 1);
      } else {
        return null;
      }
    }
  }

  static saveTokenToFirestore({required String token}) async {
    bool isUserLoggedin = await AuthService.isLoggedIn();
    print("User is logged in $isUserLoggedin");
    // kiểm tra nếu đã đăng nhập vào firebase thì lưu token vào firestore
    if (isUserLoggedin) {
      await CRUDService.saveUserToken(token!);
      print("save to firestore");
    }
    // lưu nếu mã thông báo thay đổi
    _firebaseMessaging.onTokenRefresh.listen((event) async {
      if (isUserLoggedin) {
        await CRUDService.saveUserToken(token!);
        print("save to firestore");
      }
    });
  }

  // kích hoạt thông báo cục bộ
  static Future localNotiInit() async {
    // khởi tạo plugin. app_icon cần được thêm dưới dạng tài nguyên có thể vẽ vào dự án chính của Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    // yêu cầu quyền thông báo cho android 13 trở lên
    _flutterLocalNotificationsPlugin

    .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  // khi chạm vào thông báo cục bộ ở nền trước
  static void onNotificationTap(NotificationResponse notificationResponse) {
    navigatorKey.currentState!.pushNamed("/home");
  }

  // hiển thị một thông báo đơn giản
  static Future showSimpleNotification(
      {required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}