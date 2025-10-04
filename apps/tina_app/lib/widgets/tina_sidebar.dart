import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tina_ui/ui.dart';

/// A sidebar widget that handles business logic and navigation state.
///
/// This widget manages the sidebar's expand/collapse state, responsive behavior,
/// and navigation logic. It uses a hybrid approach:
/// - Desktop: Shows persistent collapsible sidebar
/// - Mobile: Uses Scaffold's drawer pattern for native platform behavior
/// It delegates the visual presentation to TinaSidebarOrganism from the tina_ui package.
class TinaSidebar extends StatefulWidget {
  /// Creates a Tina sidebar widget.
  const TinaSidebar({
    super.key,
    required this.child,
    this.isInitiallyExpanded = true,
  });

  /// The main content to display next to the sidebar.
  final Widget child;

  /// Whether the sidebar should be expanded initially (desktop only).
  final bool isInitiallyExpanded;

  @override
  State<TinaSidebar> createState() => _TinaSidebarState();
}

class _TinaSidebarState extends State<TinaSidebar>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Navigation configuration
  static const List<Map<String, dynamic>> _navigationConfig = [
    {'icon': Icons.dashboard_outlined, 'label': 'Home', 'route': '/'},
    {'icon': Icons.chat_outlined, 'label': 'Chats', 'route': '/chats'},
    {'icon': Icons.build_circle_outlined, 'label': 'Tools', 'route': '/tools'},
    {'icon': Icons.memory_outlined, 'label': 'Models', 'route': '/models'},
    {'icon': Icons.smart_toy_outlined, 'label': 'Agents', 'route': '/agents'},
    {
      'icon': Icons.description_outlined,
      'label': 'Prompts',
      'route': '/prompts',
    },
  ];

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Handles navigation when a navigation item is tapped.
  void _handleNavigation(String route) {
    // Close drawer if open (mobile)
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      Navigator.pop(context);
    }
    context.go(route);
  }

  /// Handles settings navigation.
  void _handleSettingsNavigation() {
    context.go('/settings');
  }

  /// Builds the list of navigation items with active state.
  List<NavigationItem> _buildNavigationItems() {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return _navigationConfig.map((item) {
      final route = item['route'] as String;
      final isActive =
          currentRoute == route ||
          (route != '/' && currentRoute.startsWith(route));

      return NavigationItem(
        icon: item['icon'] as IconData,
        label: item['label'] as String,
        route: route,
        isActive: isActive,
      );
    }).toList();
  }

  /// Builds the header widget with the TINA logo.
  Widget _buildHeader(BuildContext context, {bool isDrawer = false}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: context.tinaColors.primary,
        borderRadius: BorderRadius.circular(context.tinaTheme.borderRadius.lg),
      ),
      child: Center(
        child: TinaText(
          isDrawer ? 'TINA' : (_isExpanded ? 'TINA' : 'T'),
          style: TinaTextStyle.heading5,
          color: context.tinaColors.onPrimary,
        ),
      ),
    );
  }

  /// Builds the footer widget with settings.
  Widget _buildFooter(BuildContext context, {bool isDrawer = false}) {
    final isActive = GoRouterState.of(context).uri.toString() == '/settings';

    return TinaTile(
      variant: isActive ? TinaTileVariant.primary : TinaTileVariant.ghost,
      size: TinaTileSize.medium,
      leading: Icon(
        Icons.settings_outlined,
        size: 24,
        color: isActive
            ? context.tinaColors.onPrimary
            : context.tinaColors.onSurfaceVariant,
      ),
      onTap: _handleSettingsNavigation,
      child: (isDrawer || _isExpanded)
          ? TinaText(
              'Settings',
              style: TinaTextStyle.bodySmall,
              color: isActive
                  ? context.tinaColors.onPrimary
                  : context.tinaColors.onSurface,
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    // Auto-collapse on small screens, auto-expand on large screens
    if (isSmallScreen && _isExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isExpanded = false;
            _animationController.reverse();
          });
        }
      });
    } else if (!isSmallScreen && !_isExpanded && widget.isInitiallyExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isExpanded = true;
            _animationController.forward();
          });
        }
      });
    }

    if (isSmallScreen) {
      // Mobile: Use Scaffold drawer pattern
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('TINA'),
          backgroundColor: context.tinaColors.primary,
          foregroundColor: context.tinaColors.onPrimary,
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: context.tinaColors.surface,
          child: TinaSidebarOrganism(
            isExpanded: true, // Always expanded in drawer mode
            animation: const AlwaysStoppedAnimation(1.0),
            navigationItems: _buildNavigationItems(),
            onNavigationTap: _handleNavigation,
            header: _buildHeader(context, isDrawer: true),
            footer: _buildFooter(context, isDrawer: true),
          ),
        ),
        body: widget.child,
      );
    } else {
      // Desktop: Use persistent sidebar
      return Scaffold(
        body: Row(
          children: [
            // Sidebar UI Component
            TinaSidebarOrganism(
              isExpanded: _isExpanded,
              animation: _animation,
              navigationItems: _buildNavigationItems(),
              onNavigationTap: _handleNavigation,
              header: _buildHeader(context),
              footer: _buildFooter(context),
            ),

            // Main Content
            Expanded(child: widget.child),
          ],
        ),
      );
    }
  }
}
