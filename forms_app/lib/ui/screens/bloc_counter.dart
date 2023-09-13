import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocState = context.read<CounterBloc>().state;
    final blocProvider = context.watch<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc count ${blocState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () {
                blocProvider.resetCounter();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Text('Counter value: ${blocState.counter}'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              blocProvider.increaseBy(3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              blocProvider.increaseBy(2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              blocProvider.increaseBy(1);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
