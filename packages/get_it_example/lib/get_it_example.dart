import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class CounterService {
  int count = 0;
  void increment() => count++;
}

class GetItExamplePage extends StatefulWidget {
  const GetItExamplePage({super.key});

  @override
  State<GetItExamplePage> createState() => _GetItExamplePageState();
}

class _GetItExamplePageState extends State<GetItExamplePage> {
  final CounterService _service = getIt<CounterService>();

  @override
  void initState() {
    super.initState();
    if (!getIt.isRegistered<CounterService>()) {
      getIt.registerSingleton(CounterService());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetIt Example')),
      body: Center(child: Text('Count: ${_service.count}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _service.increment();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
