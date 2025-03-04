import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter.g.dart';

// @riverpod
// class Counter extends _$Counter {
//   @override
//   int build() {
//     return 77;
//   }

//   void increment() {
//     state++;
//   }

// }

@riverpod
class Counter extends _$Counter {
  @override
  FutureOr<int> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter') ?? 0;
  }

  Future<void> increment() async {
    final currentState = await future;
    
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', currentState + 1);
    state = AsyncData(currentState + 1);
  }


}
