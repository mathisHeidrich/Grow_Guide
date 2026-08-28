import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/plant.dart';
import '../models/app_settings.dart';

class DatabaseService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [PlantSchema, AppSettingsSchema],
      directory: dir.path,
    );
    
    // Initialize default AppSettings if empty
    if (await isar.appSettings.count() == 0) {
      await isar.writeTxn(() async {
        await isar.appSettings.put(AppSettings());
      });
    }
  }
}
