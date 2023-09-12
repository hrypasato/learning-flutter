import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'themechanger_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            icon: Icon(_getIconData(isDarkMode)),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }

  IconData _getIconData(bool isDark) {
    return isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined;
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = value!;
          },
        );
      },
    );
  }
}
