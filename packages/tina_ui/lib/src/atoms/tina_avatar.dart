import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable avatar component following the Tina design system.
///
/// This avatar widget supports images, initials, and icons with consistent
/// sizing and styling across the application.
class TinaAvatar extends StatelessWidget {
  /// Creates a Tina avatar with an image.
  const TinaAvatar.image({
    required this.imageProvider,
    super.key,
    this.size = TinaAvatarSize.medium,
    this.fallbackText,
    this.fallbackIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticLabel,
    this.onTap,
  }) : initials = null,
       icon = null;

  /// Creates a Tina avatar with initials.
  const TinaAvatar.initials({
    required this.initials,
    super.key,
    this.size = TinaAvatarSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticLabel,
    this.onTap,
  }) : imageProvider = null,
       fallbackText = null,
       fallbackIcon = null,
       icon = null;

  /// Creates a Tina avatar with an icon.
  const TinaAvatar.icon({
    required this.icon,
    super.key,
    this.size = TinaAvatarSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticLabel,
    this.onTap,
  }) : imageProvider = null,
       initials = null,
       fallbackText = null,
       fallbackIcon = null;

  /// The image provider for the avatar image.
  final ImageProvider? imageProvider;

  /// The initials to display in the avatar.
  final String? initials;

  /// The icon to display in the avatar.
  final IconData? icon;

  /// The size of the avatar.
  final TinaAvatarSize size;

  /// Fallback text to display if the image fails to load.
  final String? fallbackText;

  /// Fallback icon to display if the image fails to load.
  final IconData? fallbackIcon;

  /// The background color of the avatar.
  final Color? backgroundColor;

  /// The foreground color (text/icon color) of the avatar.
  final Color? foregroundColor;

  /// A semantic label for the avatar for accessibility.
  final String? semanticLabel;

  /// Called when the avatar is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final avatarSize = _getAvatarSize();
    final bgColor = backgroundColor ?? _getDefaultBackgroundColor(tinaColors);
    final fgColor = foregroundColor ?? _getDefaultForegroundColor(tinaColors);

    Widget avatar = Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: const [DesignShadows.sm],
      ),
      child: ClipOval(
        child: _buildAvatarContent(fgColor),
      ),
    );

    if (semanticLabel != null) {
      avatar = Semantics(
        label: semanticLabel,
        child: avatar,
      );
    }

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(avatarSize / 2),
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _buildAvatarContent(Color foregroundColor) {
    if (imageProvider != null) {
      return Image(
        image: imageProvider!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackContent(foregroundColor);
        },
      );
    }

    if (initials != null) {
      return Center(
        child: TinaText(
          style: _getTextStyle(),
          child: Text(
            initials!.toUpperCase(),
            // TODO(style): check color
            style: TextStyle(
              color: foregroundColor,
            ),
          ),
        ),
      );
    }

    if (icon != null) {
      return Center(
        child: Icon(
          icon,
          size: _getIconSize(),
          color: foregroundColor,
        ),
      );
    }

    return _buildFallbackContent(foregroundColor);
  }

  Widget _buildFallbackContent(Color foregroundColor) {
    if (fallbackText != null) {
      return Center(
        child: TinaText(
          style: _getTextStyle(),
          child: Text(
            fallbackText!.toUpperCase(),
            // TODO(style): check color
            style: TextStyle(
              color: foregroundColor,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Icon(
        fallbackIcon ?? Icons.person,
        size: _getIconSize(),
        color: foregroundColor,
      ),
    );
  }

  double _getAvatarSize() {
    return switch (size) {
      TinaAvatarSize.extraSmall => 24.0,
      TinaAvatarSize.small => 32.0,
      TinaAvatarSize.medium => 40.0,
      TinaAvatarSize.large => 48.0,
      TinaAvatarSize.extraLarge => 64.0,
      TinaAvatarSize.huge => 96.0,
    };
  }

  double _getIconSize() {
    return switch (size) {
      TinaAvatarSize.extraSmall => 12.0,
      TinaAvatarSize.small => 16.0,
      TinaAvatarSize.medium => 20.0,
      TinaAvatarSize.large => 24.0,
      TinaAvatarSize.extraLarge => 32.0,
      TinaAvatarSize.huge => 48.0,
    };
  }

  TinaTextStyle _getTextStyle() {
    return switch (size) {
      TinaAvatarSize.extraSmall => TinaTextStyle.caption,
      TinaAvatarSize.small => TinaTextStyle.bodySmall,
      TinaAvatarSize.medium => TinaTextStyle.body,
      TinaAvatarSize.large => TinaTextStyle.bodyLarge,
      TinaAvatarSize.extraLarge => TinaTextStyle.heading6,
      TinaAvatarSize.huge => TinaTextStyle.heading4,
    };
  }

  Color _getDefaultBackgroundColor(TinaColorScheme colors) {
    return colors.primary;
  }

  Color _getDefaultForegroundColor(TinaColorScheme colors) {
    return colors.onPrimary;
  }
}

/// A specialized avatar group component for displaying multiple avatars.
///
/// This component stacks avatars with proper overlap and provides a way
/// to show additional count when there are more avatars than can be displayed.
class TinaAvatarGroup extends StatelessWidget {
  /// Creates a Tina avatar group.
  const TinaAvatarGroup({
    required this.avatars,
    super.key,
    this.size = TinaAvatarSize.medium,
    this.maxVisible = 3,
    this.spacing = 8.0,
    this.showCount = true,
    this.semanticLabel,
  });

  /// The list of avatars to display.
  final List<TinaAvatar> avatars;

  /// The size of all avatars in the group.
  final TinaAvatarSize size;

  /// The maximum number of avatars to show before displaying a count.
  final int maxVisible;

  /// The spacing between avatars (negative for overlap).
  final double spacing;

  /// Whether to show a count avatar when there are more avatars than
  /// maxVisible.
  final bool showCount;

  /// A semantic label for the avatar group for accessibility.
  final String? semanticLabel;

  double _getAvatarSize(TinaAvatarSize size) {
    return switch (size) {
      TinaAvatarSize.extraSmall => 24,
      TinaAvatarSize.small => 32,
      TinaAvatarSize.medium => 40,
      TinaAvatarSize.large => 48,
      TinaAvatarSize.extraLarge => 64,
      TinaAvatarSize.huge => 96,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) return const SizedBox.shrink();

    final tinaColors = context.tinaColors;
    final visibleAvatars = avatars.take(maxVisible).toList();
    final remainingCount = avatars.length - maxVisible;
    final hasMore = remainingCount > 0 && showCount;

    Widget group;

    if (spacing < 0) {
      // For negative spacing (overlapping), use Stack
      final avatarSize = _getAvatarSize(size);
      final totalAvatars = visibleAvatars.length + (hasMore ? 1 : 0);
      final overlap = spacing.abs();
      final totalWidth =
          avatarSize + (totalAvatars - 1) * (avatarSize - overlap);

      group = SizedBox(
        width: totalWidth,
        child: Stack(
          children: [
            ...visibleAvatars.asMap().entries.map((entry) {
              final index = entry.key;
              final avatar = entry.value;

              return Positioned(
                left: index * (avatarSize - overlap),
                child: avatar,
              );
            }),
            if (hasMore)
              Positioned(
                left: visibleAvatars.length * (avatarSize - overlap),
                child: TinaAvatar.initials(
                  initials: '+$remainingCount',
                  size: size,
                  backgroundColor: tinaColors.surfaceVariant,
                  foregroundColor: tinaColors.onSurfaceVariant,
                ),
              ),
          ],
        ),
      );
    } else {
      // For positive spacing, use Row with padding
      group = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...visibleAvatars.asMap().entries.map((entry) {
            final index = entry.key;
            final avatar = entry.value;

            return Padding(
              padding: EdgeInsets.only(
                left: index > 0 ? spacing : 0,
              ),
              child: avatar,
            );
          }),
          if (hasMore)
            Padding(
              padding: EdgeInsets.only(left: spacing),
              child: TinaAvatar.initials(
                initials: '+$remainingCount',
                size: size,
                backgroundColor: tinaColors.surfaceVariant,
                foregroundColor: tinaColors.onSurfaceVariant,
              ),
            ),
        ],
      );
    }

    if (semanticLabel != null) {
      group = Semantics(
        label: semanticLabel,
        child: group,
      );
    }

    return group;
  }
}

/// The size of a [TinaAvatar].
enum TinaAvatarSize {
  /// Extra small avatar (24px).
  extraSmall,

  /// Small avatar (32px).
  small,

  /// Medium avatar (40px) - default.
  medium,

  /// Large avatar (48px).
  large,

  /// Extra large avatar (64px).
  extraLarge,

  /// Huge avatar (96px).
  huge,
}
