import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: context.auraColors.primary,
        foregroundColor: context.auraColors.onPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workspace Management Section
            AuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuraText(
                    style: AuraTextStyle.heading6,
                    color: AuraTextColor.onSurface,
                    child: Text('Workspace Management'),
                  ),
                  const SizedBox(height: 8),
                  const AuraText(
                    style: AuraTextStyle.bodySmall,
                    color: AuraTextColor.onSurfaceVariant,
                    child: Text(
                      'Manage your workspaces and switch between different environments',
                    ),
                  ),
                  const SizedBox(height: 16),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.workspaces_outline,
                      color: context.auraColors.primary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.auraColors.onSurfaceVariant,
                    ),
                    onTap: () => context.go('/workspaces'),
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('Manage Workspaces'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // App Settings Section
            AuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuraText(
                    style: AuraTextStyle.heading6,
                    color: AuraTextColor.onSurface,
                    child: Text('App Settings'),
                  ),
                  const SizedBox(height: 8),
                  const AuraText(
                    style: AuraTextStyle.bodySmall,
                    color: AuraTextColor.onSurfaceVariant,
                    child: Text('Configure your app preferences and behavior'),
                  ),
                  const SizedBox(height: 16),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.palette_outlined,
                      color: context.auraColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.auraColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to theme settings
                      _showComingSoonDialog(context, 'Theme Settings');
                    },
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('Theme & Appearance'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.notifications_outlined,
                      color: context.auraColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.auraColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to notification settings
                      _showComingSoonDialog(context, 'Notification Settings');
                    },
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('Notifications'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: context.auraColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.auraColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to privacy settings
                      _showComingSoonDialog(context, 'Privacy Settings');
                    },
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('Privacy & Security'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // About Section
            AuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuraText(
                    style: AuraTextStyle.heading6,
                    color: AuraTextColor.onSurface,
                    child: Text('About'),
                  ),
                  const SizedBox(height: 8),
                  const AuraText(
                    style: AuraTextStyle.bodySmall,
                    color: AuraTextColor.onSurfaceVariant,
                    child: Text('App information and version details'),
                  ),
                  const SizedBox(height: 16),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.info_outline,
                      color: context.auraColors.secondary,
                    ),
                    onTap: () {
                      _showAppInfoDialog(context);
                    },
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('App Version'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AuraTile(
                    variant: AuraTileVariant.ghost,
                    leading: Icon(
                      Icons.help_outline,
                      color: context.auraColors.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: context.auraColors.onSurfaceVariant,
                    ),
                    onTap: () {
                      // TODO: Navigate to help section
                      _showComingSoonDialog(context, 'Help & Support');
                    },
                    child: const AuraText(
                      style: AuraTextStyle.bodyLarge,
                      child: Text('Help & Support'),
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
    showDialog<void>(
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
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Aura AI Assistant'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 8),
            Text('Build: 1'),
            SizedBox(height: 16),
            Text(
              'Aura is your AI-powered assistant for productivity and creativity.',
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
