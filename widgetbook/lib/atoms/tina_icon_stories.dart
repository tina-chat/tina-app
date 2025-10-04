import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Icons', type: TinaIcon)
Widget basicIconsUseCase(BuildContext context) {
  return const Center(
    child: Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        TinaIcon(Icons.home),
        TinaIcon(Icons.search),
        TinaIcon(Icons.notifications),
        TinaIcon(Icons.person),
        TinaIcon(Icons.settings),
        TinaIcon(Icons.favorite),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Sizes', type: TinaIcon)
Widget iconSizesUseCase(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TinaIcon(Icons.star, size: TinaIconSize.extraSmall),
      SizedBox(height: 16),
      TinaIcon(Icons.star, size: TinaIconSize.small),
      SizedBox(height: 16),
      TinaIcon(Icons.star, size: TinaIconSize.medium),
      SizedBox(height: 16),
      TinaIcon(Icons.star, size: TinaIconSize.large),
      SizedBox(height: 16),
      TinaIcon(Icons.star, size: TinaIconSize.extraLarge),
      SizedBox(height: 16),
      TinaIcon(Icons.star, size: TinaIconSize.huge),
    ],
  );
}

@widgetbook.UseCase(name: 'Colored Icons', type: TinaIcon)
Widget coloredIconsUseCase(BuildContext context) {
  return const Wrap(
    spacing: 24,
    runSpacing: 24,
    children: [
      TinaIcon(Icons.favorite, color: Colors.red, size: TinaIconSize.large),
      TinaIcon(Icons.star, color: Colors.orange, size: TinaIconSize.large),
      TinaIcon(
        Icons.check_circle,
        color: Colors.green,
        size: TinaIconSize.large,
      ),
      TinaIcon(Icons.info, color: Colors.blue, size: TinaIconSize.large),
      TinaIcon(Icons.warning, color: Colors.amber, size: TinaIconSize.large),
      TinaIcon(Icons.error, color: Colors.red, size: TinaIconSize.large),
    ],
  );
}

@widgetbook.UseCase(name: 'Icon Button Basic', type: TinaIconButton)
Widget iconButtonBasicUseCase(BuildContext context) {
  return Center(
    child: TinaIconButton(
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

@widgetbook.UseCase(name: 'Icon Button Variants', type: TinaIconButton)
Widget iconButtonVariantsUseCase(BuildContext context) {
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      TinaIconButton(
        icon: Icons.home,
        variant: TinaIconButtonVariant.ghost,
        onPressed: () {},
        tooltip: 'Ghost variant',
      ),
      TinaIconButton(
        icon: Icons.home,
        variant: TinaIconButtonVariant.filled,
        onPressed: () {},
        tooltip: 'Filled variant',
      ),
      TinaIconButton(
        icon: Icons.home,
        variant: TinaIconButtonVariant.outlined,
        onPressed: () {},
        tooltip: 'Outlined variant',
      ),
      TinaIconButton(
        icon: Icons.home,
        variant: TinaIconButtonVariant.elevated,
        onPressed: () {},
        tooltip: 'Elevated variant',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Icon Button Sizes', type: TinaIconButton)
Widget iconButtonSizesUseCase(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TinaIconButton(
        icon: Icons.add,
        size: TinaIconSize.small,
        onPressed: () {},
        tooltip: 'Small button',
      ),
      const SizedBox(height: 16),
      TinaIconButton(
        icon: Icons.add,
        size: TinaIconSize.medium,
        onPressed: () {},
        tooltip: 'Medium button',
      ),
      const SizedBox(height: 16),
      TinaIconButton(
        icon: Icons.add,
        size: TinaIconSize.large,
        onPressed: () {},
        tooltip: 'Large button',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Disabled Icon Button', type: TinaIconButton)
Widget disabledIconButtonUseCase(BuildContext context) {
  return const Center(
    child: TinaIconButton(
      icon: Icons.block,
      onPressed: null,
      tooltip: 'Disabled button',
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Categories', type: TinaIcon)
Widget iconCategoriesUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TinaText('Navigation', style: TinaTextStyle.heading6),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              TinaIcon(Icons.home, size: TinaIconSize.large),
              TinaIcon(Icons.menu, size: TinaIconSize.large),
              TinaIcon(Icons.arrow_back, size: TinaIconSize.large),
              TinaIcon(Icons.arrow_forward, size: TinaIconSize.large),
              TinaIcon(Icons.more_vert, size: TinaIconSize.large),
            ],
          ),
          const SizedBox(height: 24),
          const TinaText('Actions', style: TinaTextStyle.heading6),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              TinaIcon(Icons.add, size: TinaIconSize.large),
              TinaIcon(Icons.edit, size: TinaIconSize.large),
              TinaIcon(Icons.delete, size: TinaIconSize.large),
              TinaIcon(Icons.save, size: TinaIconSize.large),
              TinaIcon(Icons.share, size: TinaIconSize.large),
            ],
          ),
          const SizedBox(height: 24),
          const TinaText('Status', style: TinaTextStyle.heading6),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              TinaIcon(
                Icons.check,
                color: Colors.green,
                size: TinaIconSize.large,
              ),
              TinaIcon(
                Icons.close,
                color: Colors.red,
                size: TinaIconSize.large,
              ),
              TinaIcon(
                Icons.info,
                color: Colors.blue,
                size: TinaIconSize.large,
              ),
              TinaIcon(
                Icons.warning,
                color: Colors.orange,
                size: TinaIconSize.large,
              ),
              TinaIcon(
                Icons.error,
                color: Colors.red,
                size: TinaIconSize.large,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
