import 'package:auravibes_app/features/agents/agents_screen.dart';
import 'package:auravibes_app/features/chats/screens/chat_conversation_screen.dart';
import 'package:auravibes_app/features/chats/screens/list_chats_screen.dart';
import 'package:auravibes_app/features/chats/screens/new_chat_screen.dart';
import 'package:auravibes_app/features/home/home_screen.dart';
import 'package:auravibes_app/features/models/screens/models_screen.dart';
import 'package:auravibes_app/features/prompts/prompts_screen.dart';
import 'package:auravibes_app/features/settings/settings_screen.dart';
import 'package:auravibes_app/features/tools/tools_screen.dart';
import 'package:auravibes_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<ChatsRoute>(
      path: '/chats',
      routes: [
        TypedGoRoute<NewChatRoute>(path: 'new'),
        TypedGoRoute<CoversationRoute>(path: ':chatId'),
      ],
    ),
    TypedGoRoute<ToolsRoute>(path: '/tools'),
    TypedGoRoute<ModelsRoute>(path: '/models'),
    TypedGoRoute<AgentsRoute>(path: '/agents'),
    TypedGoRoute<PromptsRoute>(path: '/prompts'),
    TypedGoRoute<SettingsRoute>(path: '/settings'),
  ],
)
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppLayout(child: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class ChatsRoute extends GoRouteData with $ChatsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChatScreen();
  }
}

class NewChatRoute extends GoRouteData with $NewChatRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NewChatScreen();
  }
}

class CoversationRoute extends GoRouteData with $CoversationRoute {
  CoversationRoute({required this.chatId});
  String chatId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatConversationScreen(chatId: chatId);
  }
}

class ToolsRoute extends GoRouteData with $ToolsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ToolsScreen();
  }
}

class ModelsRoute extends GoRouteData with $ModelsRoute {
  // There is no need to implement [build] when this [redirect] is
  // unconditional.
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ModelsScreen();
  }
}

class AgentsRoute extends GoRouteData with $AgentsRoute {
  // There is no need to implement [build] when this [redirect] is
  // unconditional.
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AgentsScreen();
  }
}

class PromptsRoute extends GoRouteData with $PromptsRoute {
  // There is no need to implement [build] when this [redirect] is
  // unconditional.
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PromptsScreen();
  }
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  // There is no need to implement [build] when this [redirect] is
  // unconditional.
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
