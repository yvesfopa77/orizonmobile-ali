import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthClient {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isDeviceSupportedLocalAuth() async {
    if (kIsWeb) return false;
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics;
  }

  Future<bool> availableBiometrics() async {
    if (kIsWeb) return false;
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isFaceIDSupported() async {
    if (kIsWeb) return false;
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      if (availableBiometrics.contains(BiometricType.face)) {
        return true;
      }
    }

    return false;
  }

  Future<bool> authWithBiometric() async {
    if (kIsWeb) return false;
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'To continue, you must complete the biometrics',
          options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true));

      return didAuthenticate;
    } on PlatformException {
      return false;
    }
  }
}
