import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference/provider/counter.dart';
import 'package:shared_preference/provider/counter_style.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterStyle = ref.watch(counterStyleProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (counter) {
              AsyncData(:final value) => Text("$value", style: counterStyle),
              AsyncError() => Text("something wrong"),
              _ => CircularProgressIndicator(),
            },

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              child: Text("+", style: TextStyle(fontSize: 15)),
            ),

            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).reset(),
              child: Text("Сброс", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
