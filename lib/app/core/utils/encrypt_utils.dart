import 'package:encrypt/encrypt.dart';

class EncryptUtils {
  static EncryptUtils? _instance;

  // Private constructor
  EncryptUtils._();
  // Factory constructor to provide access to the singleton instance
  factory EncryptUtils.getInstance() {
    _instance ??= EncryptUtils._();
    return _instance!;
  }

  final Encrypter _encrypter = Encrypter(AES(Key.fromSecureRandom(16)));
  final IV _iv = IV.fromSecureRandom(16);

  String encrypt(String s) {
    if (s.isNotEmpty) {
      return _encrypter.encrypt(s, iv: _iv).base64;
    }
    return s;
  }

  String decrypt(String s) {
    return _encrypter.decrypt64(s, iv: _iv);
  }
}
