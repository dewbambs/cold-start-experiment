import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CounterService {
  int value = 0;
}

final getIt = GetIt.instance..registerSingleton<CounterService>(CounterService());

class GetItExamplePage extends StatefulWidget {
  const GetItExamplePage({super.key});

  @override
  State<GetItExamplePage> createState() => _GetItExamplePageState();
}

class _GetItExamplePageState extends State<GetItExamplePage> {
  final service = getIt<CounterService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetIt Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value: ${service.value}'),
            ElevatedButton(
              onPressed: () => setState(() => service.value++),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
