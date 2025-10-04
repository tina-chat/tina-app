import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TinaSidebar extends StatefulWidget {
  const TinaSidebar({
    super.key,
    required this.child,
    this.isInitiallyExpanded = true,
  });

  final Widget child;
  final bool isInitiallyExpanded;

  @override
  State<TinaSidebar> createState() => _TinaSidebarState();
}

class _TinaSidebarState extends State<TinaSidebar>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _animation;

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

  void _toggleSidebar() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    // Auto-collapse on small screens
    if (isSmallScreen && _isExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isExpanded = false;
            _animationController.reverse();
          });
        }
      });
    }

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: _isExpanded ? 280 : 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  border: const Border(
                    right: BorderSide(color: Color(0xFFE2E8F0), width: 1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      offset: const Offset(2, 0),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Logo Section
                    _buildLogoSection(),

                    // Navigation Items
                    Expanded(child: _buildNavigationItems()),

                    // Settings at bottom
                    _buildSettingsSection(),
                  ],
                ),
              );
            },
          ),

          // Main Content
          Expanded(child: widget.child),
        ],
      ),

      // Floating action button for mobile toggle
      floatingActionButton: isSmallScreen
          ? FloatingActionButton(
              onPressed: _toggleSidebar,
              backgroundColor: const Color(0xFF2563EB),
              child: Icon(
                _isExpanded ? Icons.close : Icons.menu,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  Widget _buildLogoSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: _isExpanded
          ? Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'TINA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'T',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildNavigationItems() {
    final navigationItems = [
      {'icon': Icons.dashboard_outlined, 'label': 'Home', 'route': '/'},
      {'icon': Icons.chat_outlined, 'label': 'Chats', 'route': '/chats'},
      {'icon': Icons.build_circle_outlined, 'label': 'Tools', 'route': '/tools'},
      {'icon': Icons.memory_outlined, 'label': 'Models', 'route': '/models'},
      {'icon': Icons.smart_toy_outlined, 'label': 'Agents', 'route': '/agents'},
      {'icon': Icons.description_outlined, 'label': 'Prompts', 'route': '/prompts'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: navigationItems.map((item) {
          final currentRoute = GoRouterState.of(context).uri.toString();
          final isActive =
              currentRoute == item['route'] ||
              (item['route'] != '/' &&
                  currentRoute.startsWith(item['route'] as String));

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _NavigationItem(
              icon: item['icon'] as IconData,
              text: _isExpanded ? item['label'] as String : null,
              isActive: isActive,
              onTap: () => context.go(item['route'] as String),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSettingsSection() {
    final isActive = GoRouterState.of(context).uri.toString() == '/settings';

    return Padding(
      padding: const EdgeInsets.all(8),
      child: _NavigationItem(
        icon: Icons.settings_outlined,
        text: _isExpanded ? 'Settings' : null,
        isActive: isActive,
        onTap: () => context.go('/settings'),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.icon,
    this.text,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String? text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF2563EB).withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: isActive
                    ? const Color(0xFF2563EB)
                    : const Color(0xFF64748B),
              ),
              if (text != null) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: isActive
                          ? const Color(0xFF2563EB)
                          : const Color(0xFF334155),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
