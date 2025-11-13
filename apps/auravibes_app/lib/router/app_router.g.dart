// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myShellRouteData];

RouteBase get $myShellRouteData => ShellRouteData.$route(
  navigatorKey: MyShellRouteData.$navigatorKey,
  factory: $MyShellRouteDataExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/home', factory: $HomeRoute._fromState),
    GoRouteData.$route(
      path: '/chats',
      factory: $ChatsRoute._fromState,
      routes: [
        GoRouteData.$route(path: 'new', factory: $NewChatRoute._fromState),
        GoRouteData.$route(
          path: ':chatId',
          factory: $CoversationRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(path: '/tools', factory: $ToolsRoute._fromState),
    GoRouteData.$route(path: '/models', factory: $ModelsRoute._fromState),
    GoRouteData.$route(path: '/agents', factory: $AgentsRoute._fromState),
    GoRouteData.$route(path: '/prompts', factory: $PromptsRoute._fromState),
    GoRouteData.$route(path: '/settings', factory: $SettingsRoute._fromState),
  ],
);

extension $MyShellRouteDataExtension on MyShellRouteData {
  static MyShellRouteData _fromState(GoRouterState state) =>
      const MyShellRouteData();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatsRoute on GoRouteData {
  static ChatsRoute _fromState(GoRouterState state) => ChatsRoute();

  @override
  String get location => GoRouteData.$location('/chats');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NewChatRoute on GoRouteData {
  static NewChatRoute _fromState(GoRouterState state) => NewChatRoute();

  @override
  String get location => GoRouteData.$location('/chats/new');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CoversationRoute on GoRouteData {
  static CoversationRoute _fromState(GoRouterState state) =>
      CoversationRoute(chatId: state.pathParameters['chatId']!);

  CoversationRoute get _self => this as CoversationRoute;

  @override
  String get location =>
      GoRouteData.$location('/chats/${Uri.encodeComponent(_self.chatId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ToolsRoute on GoRouteData {
  static ToolsRoute _fromState(GoRouterState state) => ToolsRoute();

  @override
  String get location => GoRouteData.$location('/tools');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ModelsRoute on GoRouteData {
  static ModelsRoute _fromState(GoRouterState state) => ModelsRoute();

  @override
  String get location => GoRouteData.$location('/models');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AgentsRoute on GoRouteData {
  static AgentsRoute _fromState(GoRouterState state) => AgentsRoute();

  @override
  String get location => GoRouteData.$location('/agents');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PromptsRoute on GoRouteData {
  static PromptsRoute _fromState(GoRouterState state) => PromptsRoute();

  @override
  String get location => GoRouteData.$location('/prompts');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
