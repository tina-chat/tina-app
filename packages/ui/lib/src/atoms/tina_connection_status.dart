import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A connection status indicator component.
///
/// This component displays the current connection status with appropriate
/// colors and optional text labels.
class TinaConnectionStatus extends StatefulWidget {
  /// Creates a Tina connection status indicator.
  const TinaConnectionStatus({
    required this.status,
    super.key,
    this.size = TinaConnectionStatusSize.medium,
    this.showLabel = false,
    this.customLabel,
  });

  /// The current connection status.
  final TinaConnectionState status;

  /// The size of the status indicator.
  final TinaConnectionStatusSize size;

  /// Whether to show a text label alongside the indicator.
  final bool showLabel;

  /// Custom label text. If null, uses default labels.
  final String? customLabel;

  @override
  State<TinaConnectionStatus> createState() => _TinaConnectionStatusState();
}

class _TinaConnectionStatusState extends State<TinaConnectionStatus>
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
    if (widget.status == TinaConnectionState.connecting) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(TinaConnectionStatus oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.status != widget.status) {
      if (widget.status == TinaConnectionState.connecting) {
        _animationController.repeat(reverse: true);
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
    final tinaColors = context.tinaColors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIndicator(tinaColors),
        if (widget.showLabel) ...[
          const SizedBox(width: DesignSpacing.sm),
          _buildLabel(tinaColors),
        ],
      ],
    );
  }

  Widget _buildIndicator(TinaColorScheme tinaColors) {
    final indicator = Container(
      width: _getIndicatorSize(),
      height: _getIndicatorSize(),
      decoration: BoxDecoration(
        color: _getStatusColor(tinaColors),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _getStatusColor(tinaColors).withValues(alpha: 0.3),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
    );

    if (widget.status == TinaConnectionState.connecting) {
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

  Widget _buildLabel(TinaColorScheme tinaColors) {
    return Text(
      widget.customLabel ?? _getDefaultLabel(),
      style: TextStyle(
        color: _getStatusColor(tinaColors),
        fontSize: _getLabelFontSize(),
        fontWeight: DesignTypography.fontWeightMedium,
        fontFamily: DesignTypography.bodyFontFamily,
      ),
    );
  }

  double _getIndicatorSize() {
    return switch (widget.size) {
      TinaConnectionStatusSize.small => 8.0,
      TinaConnectionStatusSize.medium => 12.0,
      TinaConnectionStatusSize.large => 16.0,
    };
  }

  double _getLabelFontSize() {
    return switch (widget.size) {
      TinaConnectionStatusSize.small => DesignTypography.fontSizeXs,
      TinaConnectionStatusSize.medium => DesignTypography.fontSizeSm,
      TinaConnectionStatusSize.large => DesignTypography.fontSizeBase,
    };
  }

  Color _getStatusColor(TinaColorScheme tinaColors) {
    return switch (widget.status) {
      TinaConnectionState.online => tinaColors.success,
      TinaConnectionState.offline => tinaColors.error,
      TinaConnectionState.connecting => tinaColors.warning,
    };
  }

  String _getDefaultLabel() {
    return switch (widget.status) {
      TinaConnectionState.online => 'Online',
      TinaConnectionState.offline => 'Offline',
      TinaConnectionState.connecting => 'Connecting...',
    };
  }

  String _getSemanticLabel() {
    return switch (widget.status) {
      TinaConnectionState.online => 'Connection status: Online',
      TinaConnectionState.offline => 'Connection status: Offline',
      TinaConnectionState.connecting => 'Connection status: Connecting',
    };
  }
}

/// The connection state.
enum TinaConnectionState {
  /// Connected and online.
  online,

  /// Disconnected or offline.
  offline,

  /// Currently attempting to connect.
  connecting,
}

/// The size of a [TinaConnectionStatus].
enum TinaConnectionStatusSize {
  /// A small connection status indicator.
  small,

  /// A medium connection status indicator (default).
  medium,

  /// A large connection status indicator.
  large,
}
