import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tina_ui/ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: context.tinaColors.primary,
        foregroundColor: context.tinaColors.onPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workspace Management Section
            TinaCard(
              elevation: TinaCardElevation.sm,
              padding: TinaCardPadding.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TinaText(
                    'Workspace Management',
                    style: TinaTextStyle.heading6,
                    color: context.tinaColors.onSurface,
                  ),
                  const SizedBox(height: 8),
                  TinaText(
                    'Manage your workspaces and switch between different environments',
                    style: TinaTextStyle.bodySmall,
                    color: context.tinaColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.workspaces_outline,
                      color: context.tinaColors.primary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.tinaColors.onSurfaceVariant,
                    ),
                    onTap: () => context.go('/workspaces'),
                    child: TinaText(
                      'Manage Workspaces',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // App Settings Section
            TinaCard(
              elevation: TinaCardElevation.sm,
              padding: TinaCardPadding.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TinaText(
                    'App Settings',
                    style: TinaTextStyle.heading6,
                    color: context.tinaColors.onSurface,
                  ),
                  const SizedBox(height: 8),
                  TinaText(
                    'Configure your app preferences and behavior',
                    style: TinaTextStyle.bodySmall,
                    color: context.tinaColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.palette_outlined,
                      color: context.tinaColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.tinaColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to theme settings
                      _showComingSoonDialog(context, 'Theme Settings');
                    },
                    child: TinaText(
                      'Theme & Appearance',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.notifications_outlined,
                      color: context.tinaColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.tinaColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to notification settings
                      _showComingSoonDialog(context, 'Notification Settings');
                    },
                    child: TinaText(
                      'Notifications',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: context.tinaColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.tinaColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to privacy settings
                      _showComingSoonDialog(context, 'Privacy Settings');
                    },
                    child: TinaText(
                      'Privacy & Security',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // About Section
            TinaCard(
              elevation: TinaCardElevation.sm,
              padding: TinaCardPadding.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TinaText(
                    'About',
                    style: TinaTextStyle.heading6,
                    color: context.tinaColors.onSurface,
                  ),
                  const SizedBox(height: 8),
                  TinaText(
                    'App information and version details',
                    style: TinaTextStyle.bodySmall,
                    color: context.tinaColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.info_outline,
                      color: context.tinaColors.secondary,
                    ),
                    onTap: () {
                      _showAppInfoDialog(context);
                    },
                    child: TinaText(
                      'App Version',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TinaTile(
                    variant: TinaTileVariant.ghost,
                    size: TinaTileSize.medium,
                    leading: Icon(
                      Icons.help_outline,
                      color: context.tinaColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.tinaColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to help section
                      _showComingSoonDialog(context, 'Help & Support');
                    },
                    child: TinaText(
                      'Help & Support',
                      style: TinaTextStyle.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Coming Soon'),
        content: Text('$feature will be available in a future update.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showAppInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tina AI Assistant'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 8),
            Text('Build: 1'),
            SizedBox(height: 16),
            Text(
              'Tina is your AI-powered assistant for productivity and creativity.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
