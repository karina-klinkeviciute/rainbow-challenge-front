import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    show FirebaseMessaging, RemoteMessage;
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rainbow_challenge/constants/app.dart';

import '../firebase_options.dart';

// https://medium.com/firebase-developers/flutter-fcm-how-to-navigate-to-a-particular-screen-after-tapping-on-push-notification-8cb5d5111ee6

String getNotificationCategoryRoute(String cat) {
  switch (cat) {
    case "new_challenge":
      return AppRoute.challenges;
    case "new_prize":
      return AppRoute.shopItems;
    case "challenge_confirmed":
      return AppRoute.challengesCompleted;
    default:
      return AppRoute.home;
  }
}

// String _decodeCategoryName (String payload){
//   return payload.split(':')[1].split('}')[0].trim();
// }

class FCMProvider {
  static BuildContext? _context;

  static void setContext(BuildContext context) =>
      FCMProvider._context = context;

  /// when app is in the foreground
  static Future<void> onTapNotification(NotificationResponse? response) async {
    if (FCMProvider._context == null || response?.payload == null) return;

    final _category = response?.payload as String;

    print("Category: " + _category);
    String _route = getNotificationCategoryRoute(_category);
    print("Routing to: " + _route);
    await Navigator.of(FCMProvider._context!).pushNamed(_route);
  }

  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      String notif_category = message.data["category"] ?? null;

      print("FCM provider is handling message: " + notif_category);

      // if this is available when Platform.isIOS, you'll receive the notification twice
      if (Platform.isAndroid) {
        await FirebaseService._localNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          FirebaseService.platformChannelSpecifics,
          payload: notif_category,
        );
      }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {
    print("backgroundHandler got a message in the bg");
  }
}

class FirebaseService {
  static FirebaseMessaging? _firebaseMessaging;
  static FirebaseMessaging get firebaseMessaging =>
      FirebaseService._firebaseMessaging ?? FirebaseMessaging.instance;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseService._firebaseMessaging = FirebaseMessaging.instance;
    await FirebaseService.initializeLocalNotifications();
    await FCMProvider.onMessage();
    await FirebaseService.onBackgroundMsg();
  }

  // We need to handle iOS differently, wait for APNS token first.
  /* static Future<String?> getDeviceToken() async =>
      await FirebaseMessaging.instance.getToken();
*/

  static Future<String?> getDeviceToken() async {
    try {
      // For iOS, wait for APNS token first
      if (Platform.isIOS) {
        String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken == null) {
          print("Waiting for APNS token...");
          // Wait a bit and try again
          await Future.delayed(Duration(seconds: 1));
          apnsToken = await FirebaseMessaging.instance.getAPNSToken();

          if (apnsToken == null) {
            print("APNS token still not available after waiting");
            // Return a simulator token for development
            return "ios-simulator-dev-token-${DateTime.now().millisecondsSinceEpoch}";
          }
        }
        print("APNS token obtained: ${apnsToken.substring(0, 20)}...");
      }

      return await FirebaseMessaging.instance.getToken();
    } on FirebaseException catch (e) {
      // This can happen on iOS simulators.
      print("Error getting FCM token: $e");
      // Return a placeholder token for simulators/development
      return "simulator-dev-token";
    } catch (e) {
      print("Unexpected error getting FCM token: $e");
      return null;
    }
  }

  static FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeLocalNotifications() async {
    final InitializationSettings _initSettings = InitializationSettings(
        android: AndroidInitializationSettings("@drawable/notif_icon"),
        iOS: DarwinInitializationSettings());

    /// on did receive notification response = for when app is opened via notification while in foreground on android
    await FirebaseService._localNotificationsPlugin.initialize(_initSettings,
        onDidReceiveNotificationResponse: FCMProvider.onTapNotification);

    /// need this for ios foregournd notification
    await FirebaseService.firebaseMessaging
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  static NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: AndroidNotificationDetails(
      "high_importance_channel",
      "High Importance Notifications",
      priority: Priority.max,
      importance: Importance.max,
    ),
  );

  // for receiving message when app is in background or foreground
  // static Future<void> onMessage() async {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //     if (Platform.isAndroid) {

  //       String notif_category = message.data["category"] ?? null;
  //       // if this is available when Platform.isIOS, you'll receive the notification twice
  //       await FirebaseService._localNotificationsPlugin.show(
  //         0,
  //         message.notification!.title,
  //         message.notification!.body,
  //         FirebaseService.platformChannelSpecifics,
  //         payload: notif_category,
  //       );
  //     }
  //   });
  // }

  static Future<void> onBackgroundMsg() async {
    FirebaseMessaging.onBackgroundMessage(FCMProvider.backgroundHandler);
  }
}
