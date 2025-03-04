import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference/provider/counter.dart';
import 'package:flutter/material.dart';

part 'counter_style.g.dart';

@riverpod
TextStyle counterStyle(Ref ref) {
  final counterAsync = ref.watch(counterProvider);

  return counterAsync.when(
    data: (value) {
      if (value < 5) return TextStyle(fontSize: 40, color: Colors.cyan);
      if (value < 10) return TextStyle(fontSize: 60, color: Colors.blueGrey);
      if (value < 20) return TextStyle(fontSize: 70, color: Colors.green);
      return TextStyle(fontSize: 20);
    },
    error: (_, __) => TextStyle(fontSize: 20, color: Colors.black),
    loading: () => TextStyle(fontSize: 20, color: Colors.black),
  );
}
