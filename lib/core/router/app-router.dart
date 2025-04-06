import 'package:go_router/go_router.dart';
import 'package:ejercicio2_login/presentaciones/screens/loginScreen.dart';
import 'package:ejercicio2_login/presentaciones/screens/welcomeScreen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen()
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => WelcomeScreen(name: state.extra as String),
        )
  ]
);
