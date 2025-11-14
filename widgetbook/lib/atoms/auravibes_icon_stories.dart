import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Icons', type: AuraIcon)
Widget basicIconsUseCase(BuildContext context) {
  return const Center(
    child: Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        AuraIcon(Icons.home),
        AuraIcon(Icons.search),
        AuraIcon(Icons.notifications),
        AuraIcon(Icons.person),
        AuraIcon(Icons.settings),
        AuraIcon(Icons.favorite),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Sizes', type: AuraIcon)
Widget iconSizesUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AuraIcon(Icons.star, size: AuraIconSize.extraSmall),
      SizedBox(height: 16),
      AuraIcon(Icons.star, size: AuraIconSize.small),
      SizedBox(height: 16),
      AuraIcon(Icons.star, size: AuraIconSize.medium),
      SizedBox(height: 16),
      AuraIcon(Icons.star, size: AuraIconSize.large),
      SizedBox(height: 16),
      AuraIcon(Icons.star, size: AuraIconSize.extraLarge),
      SizedBox(height: 16),
      AuraIcon(Icons.star, size: AuraIconSize.huge),
    ],
  );
}

@widgetbook.UseCase(name: 'Colored Icons', type: AuraIcon)
Widget coloredIconsUseCase(BuildContext context) {
  return const Wrap(
    spacing: 24,
    runSpacing: 24,
    children: [
      AuraIcon(Icons.favorite, color: Colors.red, size: AuraIconSize.large),
      AuraIcon(Icons.star, color: Colors.orange, size: AuraIconSize.large),
      AuraIcon(
        Icons.check_circle,
        color: Colors.green,
        size: AuraIconSize.large,
      ),
      AuraIcon(Icons.info, color: Colors.blue, size: AuraIconSize.large),
      AuraIcon(Icons.warning, color: Colors.amber, size: AuraIconSize.large),
      AuraIcon(Icons.error, color: Colors.red, size: AuraIconSize.large),
    ],
  );
}

@widgetbook.UseCase(name: 'Icon Button Basic', type: AuraIconButton)
Widget iconButtonBasicUseCase(BuildContext context) {
  return Center(
    child: AuraIconButton(
      icon: Icons.favorite,
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Icon button pressed!')));
      },
      tooltip: 'Add to favorites',
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Button Variants', type: AuraIconButton)
Widget iconButtonVariantsUseCase(BuildContext context) {
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      AuraIconButton(
        icon: Icons.home,
        variant: AuraIconButtonVariant.ghost,
        onPressed: () {},
        tooltip: 'Ghost variant',
      ),
      AuraIconButton(
        icon: Icons.home,
        variant: AuraIconButtonVariant.filled,
        onPressed: () {},
        tooltip: 'Filled variant',
      ),
      AuraIconButton(
        icon: Icons.home,
        variant: AuraIconButtonVariant.outlined,
        onPressed: () {},
        tooltip: 'Outlined variant',
      ),
      AuraIconButton(
        icon: Icons.home,
        variant: AuraIconButtonVariant.elevated,
        onPressed: () {},
        tooltip: 'Elevated variant',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Icon Button Sizes', type: AuraIconButton)
Widget iconButtonSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AuraIconButton(
        icon: Icons.add,
        size: AuraIconSize.small,
        onPressed: () {},
        tooltip: 'Small button',
      ),
      const SizedBox(height: 16),
      AuraIconButton(
        icon: Icons.add,
        size: AuraIconSize.medium,
        onPressed: () {},
        tooltip: 'Medium button',
      ),
      const SizedBox(height: 16),
      AuraIconButton(
        icon: Icons.add,
        size: AuraIconSize.large,
        onPressed: () {},
        tooltip: 'Large button',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Disabled Icon Button', type: AuraIconButton)
Widget disabledIconButtonUseCase(BuildContext context) {
  return const Center(
    child: AuraIconButton(
      icon: Icons.block,
      onPressed: null,
      tooltip: 'Disabled button',
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Categories', type: AuraIcon)
Widget iconCategoriesUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuraText(
            style: AuraTextStyle.heading6,
            child: Text('Navigation'),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              AuraIcon(Icons.home, size: AuraIconSize.large),
              AuraIcon(Icons.menu, size: AuraIconSize.large),
              AuraIcon(Icons.arrow_back, size: AuraIconSize.large),
              AuraIcon(Icons.arrow_forward, size: AuraIconSize.large),
              AuraIcon(Icons.more_vert, size: AuraIconSize.large),
            ],
          ),
          const SizedBox(height: 24),
          const AuraText(style: AuraTextStyle.heading6, child: Text('Actions')),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              AuraIcon(Icons.add, size: AuraIconSize.large),
              AuraIcon(Icons.edit, size: AuraIconSize.large),
              AuraIcon(Icons.delete, size: AuraIconSize.large),
              AuraIcon(Icons.save, size: AuraIconSize.large),
              AuraIcon(Icons.share, size: AuraIconSize.large),
            ],
          ),
          const SizedBox(height: 24),
          const AuraText(style: AuraTextStyle.heading6, child: Text('Status')),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              AuraIcon(
                Icons.check,
                color: Colors.green,
                size: AuraIconSize.large,
              ),
              AuraIcon(
                Icons.close,
                color: Colors.red,
                size: AuraIconSize.large,
              ),
              AuraIcon(
                Icons.info,
                color: Colors.blue,
                size: AuraIconSize.large,
              ),
              AuraIcon(
                Icons.warning,
                color: Colors.orange,
                size: AuraIconSize.large,
              ),
              AuraIcon(
                Icons.error,
                color: Colors.red,
                size: AuraIconSize.large,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
