import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/boletos_page.dart';
import 'pages/comida_page.dart';
import 'pages/toboganes_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/boletos',
      builder: (context, state) => const BoletosPage(),
    ),
    GoRoute(
      path: '/comida',
      builder: (context, state) => const ComidaPage(),
    ),
    GoRoute(
      path: '/toboganes',
      builder: (context, state) => const ToboganesPage(),
    ),
  ],
);
