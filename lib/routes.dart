import 'package:finence_tracker/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(initialLocation: "/home", routes: [
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
