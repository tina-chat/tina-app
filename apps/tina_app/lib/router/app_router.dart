import 'package:go_router/go_router.dart';
import '../main.dart';
import '../features/home/home_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/chats/chat_screen.dart';
import '../features/tools/tools_screen.dart';
import '../features/models/screens/models_screen.dart';
import '../features/agents/agents_screen.dart';
import '../features/prompts/prompts_screen.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppLayout(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/chats',
          builder: (context, state) => const ChatScreen(),
        ),
        GoRoute(
          path: '/tools',
          builder: (context, state) => const ToolsScreen(),
        ),
        GoRoute(
          path: '/models',
          builder: (context, state) => const ModelsScreen(),
        ),
        GoRoute(
          path: '/agents',
          builder: (context, state) => const AgentsScreen(),
        ),
        GoRoute(
          path: '/prompts',
          builder: (context, state) => const PromptsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
  initialLocation: '/',
);
