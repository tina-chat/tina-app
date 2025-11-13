import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Image Avatar', type: AuraAvatar)
Widget imageAvatarUseCase(BuildContext context) {
  return Center(
    child: AuraAvatar.image(
      imageProvider: const NetworkImage('https://via.placeholder.com/150'),
      size: AuraAvatarSize.medium,
      fallbackText: 'JD',
      semanticLabel: 'User avatar',
    ),
  );
}

@widgetbook.UseCase(name: 'Initials Avatar', type: AuraAvatar)
Widget initialsAvatarUseCase(BuildContext context) {
  return Center(
    child: AuraAvatar.initials(
      initials: 'JD',
      size: AuraAvatarSize.medium,
      semanticLabel: 'John Doe',
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Avatar', type: AuraAvatar)
Widget iconAvatarUseCase(BuildContext context) {
  return Center(
    child: AuraAvatar.icon(
      icon: Icons.person,
      size: AuraAvatarSize.medium,
      semanticLabel: 'User avatar',
    ),
  );
}

@widgetbook.UseCase(name: 'Avatar Sizes', type: AuraAvatar)
Widget avatarSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraAvatar.initials(initials: 'XS', size: AuraAvatarSize.extraSmall),
      const SizedBox(height: 16),
      AuraAvatar.initials(initials: 'S', size: AuraAvatarSize.small),
      const SizedBox(height: 16),
      AuraAvatar.initials(initials: 'M', size: AuraAvatarSize.medium),
      const SizedBox(height: 16),
      AuraAvatar.initials(initials: 'L', size: AuraAvatarSize.large),
      const SizedBox(height: 16),
      AuraAvatar.initials(initials: 'XL', size: AuraAvatarSize.extraLarge),
      const SizedBox(height: 16),
      AuraAvatar.initials(initials: 'XXL', size: AuraAvatarSize.huge),
    ],
  );
}

@widgetbook.UseCase(name: 'Interactive Avatar', type: AuraAvatar)
Widget interactiveAvatarUseCase(BuildContext context) {
  return Center(
    child: AuraAvatar.initials(
      initials: 'IA',
      size: AuraAvatarSize.large,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Avatar tapped!')));
      },
      semanticLabel: 'Tap to interact',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors Avatar', type: AuraAvatar)
Widget customColorsAvatarUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AuraAvatar.initials(
        initials: 'R',
        size: AuraAvatarSize.medium,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      AuraAvatar.initials(
        initials: 'G',
        size: AuraAvatarSize.medium,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      AuraAvatar.initials(
        initials: 'B',
        size: AuraAvatarSize.medium,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Avatar Group', type: AuraAvatarGroup)
Widget avatarGroupUseCase(BuildContext context) {
  return Center(
    child: AuraAvatarGroup(
      avatars: [
        AuraAvatar.initials(initials: 'A', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'B', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'C', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'D', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'E', size: AuraAvatarSize.medium),
      ],
      maxVisible: 3,
      spacing: -8,
      semanticLabel: '5 team members',
    ),
  );
}

@widgetbook.UseCase(name: 'Avatar Group No Count', type: AuraAvatarGroup)
Widget avatarGroupNoCountUseCase(BuildContext context) {
  return Center(
    child: AuraAvatarGroup(
      avatars: [
        AuraAvatar.initials(initials: 'X', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'Y', size: AuraAvatarSize.medium),
        AuraAvatar.initials(initials: 'Z', size: AuraAvatarSize.medium),
      ],
      showCount: false,
      spacing: 8,
      semanticLabel: '3 participants',
    ),
  );
}

@widgetbook.UseCase(name: 'Error Fallback Avatar', type: AuraAvatar)
Widget errorFallbackAvatarUseCase(BuildContext context) {
  return Center(
    child: AuraAvatar.image(
      imageProvider: const NetworkImage(
        'https://invalid-url-that-will-fail.com/image.jpg',
      ),
      size: AuraAvatarSize.medium,
      fallbackText: 'FB',
      fallbackIcon: Icons.error_outline,
      semanticLabel: 'Avatar with fallback',
    ),
  );
}
