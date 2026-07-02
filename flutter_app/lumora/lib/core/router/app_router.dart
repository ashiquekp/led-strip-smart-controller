import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}