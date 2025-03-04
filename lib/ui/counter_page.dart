import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference/provider/counter.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    TextStyle getTextStyle(int value) {
      if (value < 5) return TextStyle(fontSize: 20, color: Colors.amber);
      if (value < 10) return TextStyle(fontSize: 30, color: Colors.blue);
      if (value < 20) return TextStyle(fontSize: 0, color: Colors.red);
      return TextStyle(fontSize: 20);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (counter) {
              AsyncData(:final value) => Text(
                "$value",
                style: getTextStyle(value),              ),
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
