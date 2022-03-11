import 'package:get_storage/get_storage.dart';

class LocalStorage {
  late GetStorage _storageBox;

  static const String storagePassword = 'STORAGE_PASSWORD';

  LocalStorage() {
    _storageBox = GetStorage();
  }

  GetStorage get storageBox => _storageBox;
}
