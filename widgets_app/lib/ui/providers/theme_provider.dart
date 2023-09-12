import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);

//objeto propio

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {}
}
