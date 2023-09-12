import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/ui/providers/counter_provider.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        actions: [
          IconButton(
            icon: Icon(_getIconData(isDarkMode)),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "Valor $clickCounter",
          style: textStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.plus_one_rounded),
      ),
    );
  }

  IconData _getIconData(bool isDark) {
    return isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined;
  }
}
