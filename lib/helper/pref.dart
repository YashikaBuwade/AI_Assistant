import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class pref {
  static late Box _box;

  static Future<void> initialize() async {
    // for initializing hive to use app directory
    Hive.defaultDirectory = ( await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: 'myData');
  }
  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: false);
  static set showOnboarding(bool v) => _box.put('showOnboarding', v);
}
