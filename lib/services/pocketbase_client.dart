import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

PocketBase? _pocketBase;
Future<PocketBase> getPocketBase() async {
  if (_pocketBase != null) {
    return _pocketBase!;
  }

  final prefs = await SharedPreferences.getInstance();

  final authStore = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pub_auth'),
  );

  final pocketBaseUrl = dotenv.env['POCKETBASE_URL'] ?? 'http://10.0.2.2.8090';
  _pocketBase = PocketBase(
    pocketBaseUrl,
    authStore: authStore,
  );

  return _pocketBase!;
}