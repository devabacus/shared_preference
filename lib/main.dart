import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference/provider/counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}


class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter", style: TextStyle(fontSize: 30)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              child: Text("+", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}





class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

  class _HomeState extends State<Home2> {
  int counter = 10;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter", style: TextStyle(fontSize: 30)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("+", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
