import 'package:hive/hive.dart';

class HivesStore {
  Future<void> save({required String key, required String value}) async {
    final Box box = await Hive.openBox('appBoilerplate');
    await box.put(key, value);
    await box.close();
  }

  Future<String?> load({required String key}) async {
    final Box box = await Hive.openBox('appBoilerplate');
    String? loadData = await box.get(key);
    await box.close();
    return loadData;
  }
}
