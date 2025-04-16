import 'package:ejercicio2_login/presentaciones/screens/movie-details.dart';
import 'package:go_router/go_router.dart';
import 'package:ejercicio2_login/presentaciones/screens/loginScreen.dart';
import 'package:ejercicio2_login/presentaciones/screens/welcomeScreen.dart';
import 'package:ejercicio2_login/presentaciones/screens/listScreen.dart';
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen()
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => WelcomeScreen(name: state.extra as String),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => ListScreen()
      ),
      GoRoute(
        path: '/detail/:movieId',
        builder: (context, state) => MovieDetail(movieId: state.pathParameters['movieId'] as String),
      )
  ]
);
