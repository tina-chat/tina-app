import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/main/locale.dart';
import 'package:tina_ui/ui.dart';

import 'router/app_router.dart';
import 'widgets/tina_sidebar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainLocale.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: ProviderScope(
        child: MainLocale(
          child: MaterialApp.router(
            title: 'Tina App',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2563EB),
              ),
              useMaterial3: true,
            ),
            routerConfig: _router,
          ),
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: $appRoutes,
    initialLocation: '/home',
    navigatorKey: rootNavigatorKey,
  );
}

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TinaSidebarWrapper(child: child);
  }
}
