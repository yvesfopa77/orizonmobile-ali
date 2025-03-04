import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AppConfigService extends GetxService {
  late String? fcmToken;
  Future<AppConfigService> init() async {
    await getFirebasetoken();
    return this;
  }

  Future<void> getFirebasetoken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();

    print(fcmToken);
    var appCheckToken = await FirebaseAppCheck.instance.getToken();
    print(appCheckToken);
  }
}
