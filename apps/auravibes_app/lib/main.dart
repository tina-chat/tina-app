import 'package:auravibes_app/features/models/providers/api_model_repository_providers.dart';
import 'package:auravibes_app/main/locale.dart';
import 'package:auravibes_app/router/app_router.dart';
import 'package:auravibes_app/widgets/auravibes_sidebar.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainLocale.ensureInitialized();

  final container = ProviderContainer()..read(modelSyncServiceProvider);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MainLocale(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp.router(
        title: 'Aura App',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
          useMaterial3: true,
        ),
        routerConfig: _router,
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
  const AppLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuraSidebarWrapper(child: child);
  }
}
