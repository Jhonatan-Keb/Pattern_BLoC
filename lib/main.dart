import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patronbloc/counter/counter_bloc.dart';
import 'package:patronbloc/counter/counter_events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador con BLoC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 136, 255, 0)),
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador con BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor actual:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterDecrement()),
                  child: const Icon(Icons.remove),
                  heroTag: 'decrement',
                ),
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterReset()),
                  child: const Icon(Icons.refresh),
                  heroTag: 'reset',
                ),
                FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterIncrement()),
                  child: const Icon(Icons.add),
                  heroTag: 'increment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}