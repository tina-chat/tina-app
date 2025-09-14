import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';

/// A message delivery status indicator component.
///
/// This component displays the delivery status of messages with appropriate
/// icons and colors, typically used alongside message bubbles.
class TinaMessageStatus extends StatefulWidget {
  /// Creates a Tina message status indicator.
  const TinaMessageStatus({
    required this.status,
    super.key,
    this.size = TinaMessageStatusSize.medium,
    this.color,
    this.showAnimation = true,
  });

  /// The current message status.
  final TinaMessageDeliveryStatus status;

  /// The size of the status indicator.
  final TinaMessageStatusSize size;

  /// Custom color for the status indicator. If null, uses status-appropriate colors.
  final Color? color;

  /// Whether to show animations for status changes.
  final bool showAnimation;

  @override
  State<TinaMessageStatus> createState() => _TinaMessageStatusState();
}

class _TinaMessageStatusState extends State<TinaMessageStatus>
    with TickerProviderStateMixin {
  AnimationController? _rotationController;
  AnimationController? _scaleController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    if (!widget.showAnimation) return;
    
    if (widget.status == TinaMessageDeliveryStatus.sending) {
      _rotationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );
      
      _rotationAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(_rotationController!);
      
      _rotationController!.repeat();
    } else {
      _scaleController = AnimationController(
        duration: DesignDuration.normal,
        vsync: this,
      );
      
      _scaleAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _scaleController!,
        curve: Curves.elasticOut,
      ));
      
      _scaleController!.forward();
    }
  }

  @override
  void didUpdateWidget(TinaMessageStatus oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.status != widget.status || oldWidget.showAnimation != widget.showAnimation) {
      _disposeControllers();
      _setupAnimations();
    }
  }

  void _disposeControllers() {
    _rotationController?.dispose();
    _scaleController?.dispose();
    _rotationController = null;
    _scaleController = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = _getStatusIcon();
    final color = widget.color ?? _getStatusColor();
    
    Widget statusIcon = Icon(
      icon,
      size: _getIconSize(),
      color: color,
      semanticLabel: _getSemanticLabel(),
    );

    if (widget.showAnimation) {
      if (widget.status == TinaMessageDeliveryStatus.sending && _rotationController != null) {
        // Rotating animation for sending status
        statusIcon = AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value * 2 * 3.14159,
              child: child!,
            );
          },
          child: statusIcon,
        );
      } else if (_scaleController != null) {
        // Scale animation for other statuses
        statusIcon = AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child!,
            );
          },
          child: statusIcon,
        );
      }
    }

    return Container(
      padding: EdgeInsets.all(_getPadding()),
      child: statusIcon,
    );
  }

  IconData _getStatusIcon() {
    return switch (widget.status) {
      TinaMessageDeliveryStatus.sending => Icons.access_time,
      TinaMessageDeliveryStatus.sent => Icons.done,
      TinaMessageDeliveryStatus.delivered => Icons.done_all,
      TinaMessageDeliveryStatus.read => Icons.done_all,
      TinaMessageDeliveryStatus.error => Icons.error_outline,
    };
  }

  Color _getStatusColor() {
    return switch (widget.status) {
      TinaMessageDeliveryStatus.sending => DesignColors.neutral400,
      TinaMessageDeliveryStatus.sent => DesignColors.neutral500,
      TinaMessageDeliveryStatus.delivered => DesignColors.info,
      TinaMessageDeliveryStatus.read => DesignColors.success,
      TinaMessageDeliveryStatus.error => DesignColors.error,
    };
  }

  double _getIconSize() {
    return switch (widget.size) {
      TinaMessageStatusSize.small => 12.0,
      TinaMessageStatusSize.medium => 16.0,
      TinaMessageStatusSize.large => 20.0,
    };
  }

  double _getPadding() {
    return switch (widget.size) {
      TinaMessageStatusSize.small => 2.0,
      TinaMessageStatusSize.medium => 4.0,
      TinaMessageStatusSize.large => 6.0,
    };
  }

  String _getSemanticLabel() {
    return switch (widget.status) {
      TinaMessageDeliveryStatus.sending => 'Message is being sent',
      TinaMessageDeliveryStatus.sent => 'Message sent successfully',
      TinaMessageDeliveryStatus.delivered => 'Message delivered',
      TinaMessageDeliveryStatus.read => 'Message read by recipient',
      TinaMessageDeliveryStatus.error => 'Message failed to send',
    };
  }
}

/// The delivery status of a message.
enum TinaMessageDeliveryStatus {
  /// The message is currently being sent.
  sending,

  /// The message has been sent successfully.
  sent,

  /// The message has been delivered to the recipient.
  delivered,

  /// The message has been read by the recipient.
  read,

  /// The message failed to send.
  error,
}

/// The size of a [TinaMessageStatus].
enum TinaMessageStatusSize {
  /// A small message status indicator.
  small,

  /// A medium message status indicator (default).
  medium,

  /// A large message status indicator.
  large,
}