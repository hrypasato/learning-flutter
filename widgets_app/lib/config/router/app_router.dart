import 'package:go_router/go_router.dart';
import 'package:widgets_app/ui/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardsScreen.name,
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbar',
    name: SnackbarScreen.name,
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animated',
    name: AnimatedScreen.name,
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    path: '/controls',
    name: ControlsScreen.name,
    builder: (context, state) => const ControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    name: TutorialScreen.name,
    builder: (context, state) => const TutorialScreen(),
  ),
  GoRoute(
    path: '/infinite',
    name: InfiniteScrollScreen.name,
    builder: (context, state) => const InfiniteScrollScreen(),
  ),
  GoRoute(
    path: '/counter',
    name: CounterScreen.name,
    builder: (context, state) => const CounterScreen(),
  ),
  GoRoute(
    path: '/themes-changer',
    name: ThemeChangerScreen.name,
    builder: (context, state) => const ThemeChangerScreen(),
  ),
]);
