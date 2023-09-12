import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isDark = ref.watch(isDarkModeProvider);
    //final selectedColor = ref.watch(selectedColorProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
