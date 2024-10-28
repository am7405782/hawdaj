import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _initSharedPref();
}

Future<void> _initSharedPref() async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPref);
}

// Future<void> _initDirectory() async {
//   Directory dir = await getApplicationCacheDirectory();
//   getIt.registerSingleton<Directory>(dir);
// }
