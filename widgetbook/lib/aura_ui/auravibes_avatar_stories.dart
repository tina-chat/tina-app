import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Image Avatar', type: AuraAvatar)
Widget imageAvatarUseCase(BuildContext context) {
  return AuraAvatar.image(
    imageProvider: const NetworkImage('https://via.placeholder.com/150'),
    size: context.knobs.object.dropdown(
      label: 'size',
      options: AuraAvatarSize.values,
      initialOption: .medium,
    ),
    fallbackText: 'JD',
    semanticLabel: 'User avatar',
  );
}

@widgetbook.UseCase(name: 'Initials Avatar', type: AuraAvatar)
Widget initialsAvatarUseCase(BuildContext context) {
  return AuraAvatar.initials(
    initials: 'JD',
    size: context.knobs.object.dropdown(
      label: 'size',
      options: AuraAvatarSize.values,
      initialOption: .medium,
    ),
    semanticLabel: 'John Doe',
  );
}

@widgetbook.UseCase(name: 'Icon Avatar', type: AuraAvatar)
Widget iconAvatarUseCase(BuildContext context) {
  return AuraAvatar.icon(
    icon: Icons.person,
    size: context.knobs.object.dropdown(
      label: 'size',
      options: AuraAvatarSize.values,
      initialOption: .medium,
    ),
    semanticLabel: 'User avatar',
  );
}

@widgetbook.UseCase(name: 'Avatar Group', type: AuraAvatarGroup)
Widget avatarGroupUseCase(BuildContext context) {
  return AuraAvatarGroup(
    avatars: List.generate(
      context.knobs.int.slider(
        label: 'avatars count',
        min: 0,
        max: 10,
        description: 'add n amount of avatars',
        initialValue: 3,
      ),
      (index) => AuraAvatar.initials(
        initials: String.fromCharCode(65 + index),
        size: AuraAvatarSize.medium,
      ),
    ),
    maxVisible: context.knobs.int.slider(
      label: 'maxVisible',
      min: 0,
      max: 10,
      description: 'the max amount to be visible',
      initialValue: 3,
    ),
    spacing: context.knobs.double.slider(
      label: 'spacing',
      min: -20,
      max: 20,
      description: 'the spacing between avatars',
      initialValue: -8,
    ),
    showCount: context.knobs.boolean(label: 'showCount', initialValue: true),
    semanticLabel: '5 team members',
  );
}
