import 'package:complete_advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class NoFoundView extends StatelessWidget {
  const NoFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(
        child: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
