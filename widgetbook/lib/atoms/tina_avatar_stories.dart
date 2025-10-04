import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Image Avatar', type: TinaAvatar)
Widget imageAvatarUseCase(BuildContext context) {
  return Center(
    child: TinaAvatar.image(
      imageProvider: const NetworkImage('https://via.placeholder.com/150'),
      size: TinaAvatarSize.medium,
      fallbackText: 'JD',
      semanticLabel: 'User avatar',
    ),
  );
}

@widgetbook.UseCase(name: 'Initials Avatar', type: TinaAvatar)
Widget initialsAvatarUseCase(BuildContext context) {
  return Center(
    child: TinaAvatar.initials(
      initials: 'JD',
      size: TinaAvatarSize.medium,
      semanticLabel: 'John Doe',
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Avatar', type: TinaAvatar)
Widget iconAvatarUseCase(BuildContext context) {
  return Center(
    child: TinaAvatar.icon(
      icon: Icons.person,
      size: TinaAvatarSize.medium,
      semanticLabel: 'User avatar',
    ),
  );
}

@widgetbook.UseCase(name: 'Avatar Sizes', type: TinaAvatar)
Widget avatarSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaAvatar.initials(initials: 'XS', size: TinaAvatarSize.extraSmall),
      const SizedBox(height: 16),
      TinaAvatar.initials(initials: 'S', size: TinaAvatarSize.small),
      const SizedBox(height: 16),
      TinaAvatar.initials(initials: 'M', size: TinaAvatarSize.medium),
      const SizedBox(height: 16),
      TinaAvatar.initials(initials: 'L', size: TinaAvatarSize.large),
      const SizedBox(height: 16),
      TinaAvatar.initials(initials: 'XL', size: TinaAvatarSize.extraLarge),
      const SizedBox(height: 16),
      TinaAvatar.initials(initials: 'XXL', size: TinaAvatarSize.huge),
    ],
  );
}

@widgetbook.UseCase(name: 'Interactive Avatar', type: TinaAvatar)
Widget interactiveAvatarUseCase(BuildContext context) {
  return Center(
    child: TinaAvatar.initials(
      initials: 'IA',
      size: TinaAvatarSize.large,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Avatar tapped!')));
      },
      semanticLabel: 'Tap to interact',
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors Avatar', type: TinaAvatar)
Widget customColorsAvatarUseCase(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TinaAvatar.initials(
        initials: 'R',
        size: TinaAvatarSize.medium,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      TinaAvatar.initials(
        initials: 'G',
        size: TinaAvatarSize.medium,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      TinaAvatar.initials(
        initials: 'B',
        size: TinaAvatarSize.medium,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Avatar Group', type: TinaAvatarGroup)
Widget avatarGroupUseCase(BuildContext context) {
  return Center(
    child: TinaAvatarGroup(
      avatars: [
        TinaAvatar.initials(initials: 'A', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'B', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'C', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'D', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'E', size: TinaAvatarSize.medium),
      ],
      maxVisible: 3,
      spacing: -8,
      semanticLabel: '5 team members',
    ),
  );
}

@widgetbook.UseCase(name: 'Avatar Group No Count', type: TinaAvatarGroup)
Widget avatarGroupNoCountUseCase(BuildContext context) {
  return Center(
    child: TinaAvatarGroup(
      avatars: [
        TinaAvatar.initials(initials: 'X', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'Y', size: TinaAvatarSize.medium),
        TinaAvatar.initials(initials: 'Z', size: TinaAvatarSize.medium),
      ],
      showCount: false,
      spacing: 8,
      semanticLabel: '3 participants',
    ),
  );
}

@widgetbook.UseCase(name: 'Error Fallback Avatar', type: TinaAvatar)
Widget errorFallbackAvatarUseCase(BuildContext context) {
  return Center(
    child: TinaAvatar.image(
      imageProvider: const NetworkImage(
        'https://invalid-url-that-will-fail.com/image.jpg',
      ),
      size: TinaAvatarSize.medium,
      fallbackText: 'FB',
      fallbackIcon: Icons.error_outline,
      semanticLabel: 'Avatar with fallback',
    ),
  );
}
