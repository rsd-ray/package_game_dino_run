import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/player_data.dart';
import 'models/settings.dart';

class DinoRunHive {
  static Future<void> init() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }

    Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
    Hive.registerAdapter<Settings>(SettingsAdapter());
  }
}