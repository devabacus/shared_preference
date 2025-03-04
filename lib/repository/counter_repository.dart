import 'package:shared_preferences/shared_preferences.dart';

class CounterRepository {

  Future<void> saveCounter(int value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('counter', value);
    }

  Future<int> getCounter() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt('counter')??0;
    }

}