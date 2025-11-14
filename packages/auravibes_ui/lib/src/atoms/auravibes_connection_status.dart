import 'dart:async';

import 'package:auravibes_ui/src/tokens/auravibes_theme.dart';
import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// A connection status indicator component.
///
/// This component displays the current connection status with appropriate
/// colors and optional text labels.
class AuraConnectionStatus extends StatefulWidget {
  /// Creates a Aura connection status indicator.
  const AuraConnectionStatus({
    required this.status,
    super.key,
    this.size = AuraConnectionStatusSize.medium,
    this.showLabel = false,
    this.customLabel,
  });

  /// The current connection status.
  final AuraConnectionState status;

  /// The size of the status indicator.
  final AuraConnectionStatusSize size;

  /// Whether to show a text label alongside the indicator.
  final bool showLabel;

  /// Custom label text. If null, uses default labels.
  final String? customLabel;

  @override
  State<AuraConnectionStatus> createState() => _AuraConnectionStatusState();
}

class _AuraConnectionStatusState extends State<AuraConnectionStatus>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation =
        Tween<double>(
          begin: 0.7,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Only animate for connecting status
    if (widget.status == AuraConnectionState.connecting) {
      unawaited(_animationController.repeat(reverse: true));
    }
  }

  @override
  void didUpdateWidget(AuraConnectionStatus oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.status != widget.status) {
      if (widget.status == AuraConnectionState.connecting) {
        unawaited(_animationController.repeat(reverse: true));
      } else {
        _animationController
          ..stop()
          ..reset();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auraColors = context.auraColors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIndicator(auraColors),
        if (widget.showLabel) ...[
          const SizedBox(width: DesignSpacing.sm),
          _buildLabel(auraColors),
        ],
      ],
    );
  }

  Widget _buildIndicator(AuraColorScheme auraColors) {
    final indicator = Container(
      width: _getIndicatorSize(),
      height: _getIndicatorSize(),
      decoration: BoxDecoration(
        color: _getStatusColor(auraColors),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _getStatusColor(auraColors).withValues(alpha: 0.3),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
    );

    if (widget.status == AuraConnectionState.connecting) {
      return Semantics(
        label: _getSemanticLabel(),
        child: AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: indicator,
            );
          },
        ),
      );
    }

    return Semantics(
      label: _getSemanticLabel(),
      child: indicator,
    );
  }

  Widget _buildLabel(AuraColorScheme auraColors) {
    return Text(
      widget.customLabel ?? _getDefaultLabel(),
      style: TextStyle(
        color: _getStatusColor(auraColors),
        fontSize: _getLabelFontSize(),
        fontWeight: DesignTypography.fontWeightMedium,
        fontFamily: DesignTypography.bodyFontFamily,
      ),
    );
  }

  double _getIndicatorSize() {
    return switch (widget.size) {
      AuraConnectionStatusSize.small => 8.0,
      AuraConnectionStatusSize.medium => 12.0,
      AuraConnectionStatusSize.large => 16.0,
    };
  }

  double _getLabelFontSize() {
    return switch (widget.size) {
      AuraConnectionStatusSize.small => DesignTypography.fontSizeXs,
      AuraConnectionStatusSize.medium => DesignTypography.fontSizeSm,
      AuraConnectionStatusSize.large => DesignTypography.fontSizeBase,
    };
  }

  Color _getStatusColor(AuraColorScheme auraColors) {
    return switch (widget.status) {
      AuraConnectionState.online => auraColors.success,
      AuraConnectionState.offline => auraColors.error,
      AuraConnectionState.connecting => auraColors.warning,
    };
  }

  String _getDefaultLabel() {
    return switch (widget.status) {
      AuraConnectionState.online => 'Online',
      AuraConnectionState.offline => 'Offline',
      AuraConnectionState.connecting => 'Connecting...',
    };
  }

  String _getSemanticLabel() {
    return switch (widget.status) {
      AuraConnectionState.online => 'Connection status: Online',
      AuraConnectionState.offline => 'Connection status: Offline',
      AuraConnectionState.connecting => 'Connection status: Connecting',
    };
  }
}

/// The connection state.
enum AuraConnectionState {
  /// Connected and online.
  online,

  /// Disconnected or offline.
  offline,

  /// Currently attempting to connect.
  connecting,
}

/// The size of a [AuraConnectionStatus].
enum AuraConnectionStatusSize {
  /// A small connection status indicator.
  small,

  /// A medium connection status indicator (default).
  medium,

  /// A large connection status indicator.
  large,
}
