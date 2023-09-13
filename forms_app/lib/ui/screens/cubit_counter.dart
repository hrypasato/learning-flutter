import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    final cubitProvider = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Total Cubits: ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () {
                cubitProvider.reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Text('Counter value: ${counterState.counter}'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              cubitProvider.increaseBy(3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              cubitProvider.increaseBy(2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              cubitProvider.increaseBy(1);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
