import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:orizon/app/core/utils/app_util.dart';
import 'package:orizon/app/core/utils/encrypt_utils.dart';

class LocalStorageClient {
  static LocalStorageClient? _instance;
  late final FlutterSecureStorage _storageBox;
  Map<String, String> _storedVariables = {};
  final EncryptUtils _encrypter = EncryptUtils.getInstance();

  //--* Beginning of disk storage *--//
  //The information on stored on the disk is not saved on the keychain and gets deleted when the app is removed from the device.
  final _unencryptedStorageBox = GetStorage();

  void saveUnencryptedValue({required String key, required value}) {
    _unencryptedStorageBox.write(key, value);
  }

  dynamic readUnencryptedValue(String value) {
    return _unencryptedStorageBox.read(value);
  }

  void removeUnencryptedValue(String key) {
    _unencryptedStorageBox.remove(key);
  }

  //--* End of disk storage *--//

  // Private constructor
  LocalStorageClient._();

  // Factory constructor to provide access to the singleton instance
  factory LocalStorageClient.getInstance() {
    _instance ??= LocalStorageClient._();

    return _instance!;
  }

  Future<void> init() async {
    try {
     
      GetStorage.init();
      _storageBox = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );
      (await _storageBox.readAll(iOptions: _storageBox.iOptions, aOptions: _storageBox.aOptions))
          .forEach((key, value) {
        _storedVariables[_encrypter.encrypt(key)] = _encrypter.encrypt(value);
      });
    } catch (e) {
      AppUtil.showLog("Could not initialise local secure storage: $e");
    }
  }

  Future clearKeychain() async {
    // The Android alternative device ID is an UUID and it must be retained as if it's a persistent device ID.
    // Here we are making the variables survive a local storage deletion.

    try {
      _storedVariables = {};
      await _storageBox.deleteAll(iOptions: _storageBox.iOptions, aOptions: _storageBox.aOptions);
      await _unencryptedStorageBox.erase();
    } catch (e) {
      //In case of any errors, the variable is not stored and we get a debug error message
      AppUtil.showLog("Saving the local storage key error '$e':");
    }

    // Here we are reassigning the variables that need to survive the local storage deletion.
  }

  void saveValue({required String key, required value}) {
    try {
      _storageBox.write(
          key: key,
          value: value.toString(),
          iOptions: _storageBox.iOptions,
          aOptions: _storageBox.aOptions);
      _storedVariables[_encrypter.encrypt(key)] = _encrypter.encrypt(value.toString());
    } catch (e) {
      //In case of any errors, the variable is not stored and we get a debug error message
      AppUtil.showLog("Saving the local storage key error '$key':");
    }
  }

  dynamic readValue(String key) {
    try {
      final value = _encrypter.decrypt(_storedVariables[_encrypter.encrypt(key)] ?? '');
      if (value.toString().isBool) {
        return bool.tryParse(value.toString());
      } else {
        return value;
      }
    } catch (e) {
      //GlobalUtils.showLog("Local storage key '$key' not saved previously.");
      return null;
    }
  }

  bool exists(String key) {
    try {
      _encrypter.decrypt(_storedVariables[_encrypter.encrypt(key)]!);
      return true;
    } catch (e) {
      return false;
    }
  }

  void removeValue(String key) {
    try {
      _storageBox.delete(key: key);
      _storedVariables.remove(_encrypter.encrypt(key));
    } catch (e) {
      //In case the key cannot be found we get a debug error message.
      AppUtil.showLog("Cannot remove the local storage key '$key':  $e");
    }
  }
}
