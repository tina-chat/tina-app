import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tina_app/main/locale.dart';

import 'router/app_router.dart';
import 'widgets/tina_sidebar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainLocale.ensureInitialized();
  runApp(ProviderScope(child: MainLocale(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tina App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TinaSidebarWrapper(child: child);
  }
}
