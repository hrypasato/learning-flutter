import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/themes/app_theme.dart';
import 'package:toktik/ui/providers/discover_provider.dart';
import 'package:toktik/ui/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //por defecto tiene carga peresoza
          //lazy: false, //desactiva la carga perezosa
          create: (_) => DiscoverProvider()..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
