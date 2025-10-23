import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_message_status.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A message bubble component for chat interfaces.
///
/// This component displays chat messages with proper styling for user and AI
/// messages, including different states and content types.
class TinaMessageBubble extends StatelessWidget {
  /// Creates a Tina message bubble.
  const TinaMessageBubble({
    required this.content,
    required this.isUser,
    super.key,
    this.status = TinaMessageDeliveryStatus.sent,
    this.timestamp,
    this.contentType = TinaMessageContentType.text,
    this.onTap,
    this.onLongPress,
    this.maxWidth,
  });

  /// The content of the message.
  final String content;

  /// Whether this message is from the user (true) or AI (false).
  final bool isUser;

  /// The delivery status of the message.
  final TinaMessageDeliveryStatus status;

  /// The timestamp when the message was sent.
  final DateTime? timestamp;

  /// The type of content in the message.
  final TinaMessageContentType contentType;

  /// Called when the message bubble is tapped.
  final VoidCallback? onTap;

  /// Called when the message bubble is long pressed.
  final VoidCallback? onLongPress;

  /// Maximum width of the message bubble.
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? MediaQuery.of(context).size.width * 0.75,
          ),
          margin: EdgeInsets.only(
            left: isUser ? DesignSpacing.xl : DesignSpacing.md,
            right: isUser ? DesignSpacing.md : DesignSpacing.xl,
            bottom: DesignSpacing.sm,
          ),
          child: Column(
            crossAxisAlignment: isUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: _getPadding(),
                decoration: _getDecoration(tinaColors),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(tinaColors),
                    if (timestamp != null) ...[
                      const SizedBox(height: DesignSpacing.xs),
                      _buildTimestamp(tinaColors),
                    ],
                  ],
                ),
              ),
              if (isUser && status != TinaMessageDeliveryStatus.sent) ...[
                const SizedBox(height: DesignSpacing.xs / 2),
                _buildStatusIndicator(tinaColors),
              ],
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    return switch (contentType) {
      TinaMessageContentType.text => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.md,
        vertical: DesignSpacing.sm,
      ),
      TinaMessageContentType.image => const EdgeInsets.all(DesignSpacing.xs),
      TinaMessageContentType.file => const EdgeInsets.all(DesignSpacing.sm),
    };
  }

  BoxDecoration _getDecoration(TinaColorScheme tinaColors) {
    final baseColor = isUser ? tinaColors.primary : tinaColors.surfaceVariant;

    final errorColor = status == TinaMessageDeliveryStatus.error
        ? tinaColors.error.withValues(alpha: 0.1)
        : null;

    return BoxDecoration(
      color: errorColor ?? baseColor,
      borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
      border: status == TinaMessageDeliveryStatus.error
          ? Border.all(color: tinaColors.error)
          : null,
      boxShadow: [
        if (status != TinaMessageDeliveryStatus.error) DesignShadows.sm,
      ],
    );
  }

  Widget _buildContent(TinaColorScheme tinaColors) {
    final textColor = isUser ? tinaColors.onPrimary : tinaColors.onSurface;

    return switch (contentType) {
      TinaMessageContentType.text => SelectableText(
        content,
        style: TextStyle(
          color: textColor,
          fontSize: DesignTypography.fontSizeBase,
          fontFamily: DesignTypography.bodyFontFamily,
          height: DesignTypography.lineHeightBase,
        ),
      ),
      TinaMessageContentType.image => ClipRRect(
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        child: Image.network(
          content,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            padding: const EdgeInsets.all(DesignSpacing.md),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.broken_image,
                  color: textColor,
                  size: 20,
                ),
                const SizedBox(width: DesignSpacing.sm),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
      TinaMessageContentType.file => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.attach_file,
            color: textColor,
            size: 20,
          ),
          const SizedBox(width: DesignSpacing.sm),
          Flexible(
            child: Text(
              content,
              style: TextStyle(
                color: textColor,
                fontSize: DesignTypography.fontSizeBase,
                fontFamily: DesignTypography.bodyFontFamily,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    };
  }

  Widget _buildTimestamp(TinaColorScheme tinaColors) {
    final textColor = isUser
        ? tinaColors.onPrimary.withValues(alpha: 0.7)
        : tinaColors.onSurfaceVariant;

    return Text(
      _formatTimestamp(timestamp!),
      style: TextStyle(
        color: textColor,
        fontSize: DesignTypography.fontSizeXs,
        fontFamily: DesignTypography.bodyFontFamily,
      ),
    );
  }

  Widget _buildStatusIndicator(TinaColorScheme tinaColors) {
    final icon = switch (status) {
      TinaMessageDeliveryStatus.sending => Icons.access_time,
      TinaMessageDeliveryStatus.sent => Icons.done,
      TinaMessageDeliveryStatus.delivered => Icons.done_all,
      TinaMessageDeliveryStatus.read => Icons.done_all,
      TinaMessageDeliveryStatus.error => Icons.error_outline,
    };

    final color = switch (status) {
      TinaMessageDeliveryStatus.sending =>
        tinaColors.onSurfaceVariant.withValues(alpha: 0.6),
      TinaMessageDeliveryStatus.sent => tinaColors.onSurfaceVariant.withValues(
        alpha: 0.6,
      ),
      TinaMessageDeliveryStatus.delivered => tinaColors.info,
      TinaMessageDeliveryStatus.read => tinaColors.info,
      TinaMessageDeliveryStatus.error => tinaColors.error,
    };

    return Icon(
      icon,
      size: 16,
      color: color,
      semanticLabel: _getStatusSemanticLabel(status),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  String _getStatusSemanticLabel(TinaMessageDeliveryStatus status) {
    return switch (status) {
      TinaMessageDeliveryStatus.sending => 'Message sending',
      TinaMessageDeliveryStatus.sent => 'Message sent',
      TinaMessageDeliveryStatus.delivered => 'Message delivered',
      TinaMessageDeliveryStatus.read => 'Message read',
      TinaMessageDeliveryStatus.error => 'Message failed to send',
    };
  }
}

/// The delivery status of a message.

/// The type of content in a message.
enum TinaMessageContentType {
  /// Plain text content.
  text,

  /// Image content.
  image,

  /// File attachment.
  file,
}
