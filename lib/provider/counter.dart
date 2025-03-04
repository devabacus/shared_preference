import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter.g.dart';




@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 77;
  }

  void increment() {
    state++;
  }

}
