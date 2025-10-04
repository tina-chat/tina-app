import 'package:flutter/material.dart';
import 'package:tina_ui/ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Card', type: TinaCard)
Widget basicCardUseCase(BuildContext context) {
  return Center(
    child: TinaCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TinaText('Card Title', style: TinaTextStyle.heading6),
          SizedBox(height: 8),
          TinaText(
            'This is a basic card with some content inside it. Cards are great for organizing information.',
            style: TinaTextStyle.body,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Card Elevations', type: TinaCard)
Widget cardElevationsUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TinaText('Card Elevations', style: TinaTextStyle.heading5),
          const SizedBox(height: 24),
          TinaCard(
            elevation: TinaCardElevation.none,
            child: const TinaText('No Elevation', style: TinaTextStyle.body),
          ),
          const SizedBox(height: 16),
          TinaCard(
            elevation: TinaCardElevation.sm,
            child: const TinaText('Small Elevation', style: TinaTextStyle.body),
          ),
          const SizedBox(height: 16),
          TinaCard(
            elevation: TinaCardElevation.md,
            child: const TinaText(
              'Medium Elevation',
              style: TinaTextStyle.body,
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            elevation: TinaCardElevation.lg,
            child: const TinaText('Large Elevation', style: TinaTextStyle.body),
          ),
          const SizedBox(height: 16),
          TinaCard(
            elevation: TinaCardElevation.xl,
            child: const TinaText(
              'Extra Large Elevation',
              style: TinaTextStyle.body,
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Card Padding Variants', type: TinaCard)
Widget cardPaddingVariantsUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TinaText(
            'Card Padding Variants',
            style: TinaTextStyle.heading5,
          ),
          const SizedBox(height: 24),
          TinaCard.noPadding(
            child: Container(
              color: Colors.blue.withValues(alpha: 0.1),
              child: const TinaText('No Padding', style: TinaTextStyle.body),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard.compact(
            child: Container(
              color: Colors.green.withValues(alpha: 0.1),
              child: const TinaText(
                'Compact Padding',
                style: TinaTextStyle.body,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: Container(
              color: Colors.orange.withValues(alpha: 0.1),
              child: const TinaText(
                'Medium Padding (Default)',
                style: TinaTextStyle.body,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard.spacious(
            child: Container(
              color: Colors.purple.withValues(alpha: 0.1),
              child: const TinaText(
                'Spacious Padding',
                style: TinaTextStyle.body,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Interactive Card', type: TinaCard)
Widget interactiveCardUseCase(BuildContext context) {
  return Center(
    child: TinaCard(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Card tapped!')));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.touch_app, size: 48, color: Colors.blue),
          SizedBox(height: 16),
          TinaText('Tap Me!', style: TinaTextStyle.heading6),
          SizedBox(height: 8),
          TinaText(
            'This card is interactive. Tap it to see the response.',
            style: TinaTextStyle.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors Card', type: TinaCard)
Widget customColorsCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        TinaCard(
          backgroundColor: Colors.blue.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TinaText('Info Card', style: TinaTextStyle.heading6),
              SizedBox(height: 8),
              TinaText(
                'This card has a custom light blue background.',
                style: TinaTextStyle.body,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TinaCard(
          backgroundColor: Colors.green.shade50,
          borderColor: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TinaText('Success Card', style: TinaTextStyle.heading6),
              SizedBox(height: 8),
              TinaText(
                'This card has a green background and border.',
                style: TinaTextStyle.body,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TinaCard(
          backgroundColor: Colors.red.shade50,
          borderColor: Colors.red.shade300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TinaText('Error Card', style: TinaTextStyle.heading6),
              SizedBox(height: 8),
              TinaText(
                'This card has a red background and border.',
                style: TinaTextStyle.body,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Content Card', type: TinaCard)
Widget contentCardUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 320,
      child: TinaCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 64, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            const TinaText(
              'Card with Image Placeholder',
              style: TinaTextStyle.heading6,
            ),
            const SizedBox(height: 8),
            const TinaText(
              'This card demonstrates how to structure content with images, titles, and descriptions. Perfect for product cards or article previews.',
              style: TinaTextStyle.body,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TinaText(
                  '\$29.99',
                  style: TinaTextStyle.heading6,
                  color: Colors.green,
                ),
                TinaButton(
                  onPressed: () {},
                  variant: TinaButtonVariant.primary,
                  size: TinaButtonSize.small,
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'List Card', type: TinaCard)
Widget listCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TinaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TinaText('Settings', style: TinaTextStyle.heading6),
          const SizedBox(height: 16),
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    [
                      Icons.person,
                      Icons.notifications,
                      Icons.security,
                      Icons.help,
                    ][index],
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TinaText(
                      ['Profile', 'Notifications', 'Security', 'Help'][index],
                      style: TinaTextStyle.body,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey.shade400),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Semantic Card', type: TinaCard)
Widget semanticCardUseCase(BuildContext context) {
  return Center(
    child: TinaCard(
      semanticLabel: 'User profile card for John Doe',
      child: Row(
        children: [
          TinaAvatar.initials(initials: 'JD', size: TinaAvatarSize.large),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TinaText('John Doe', style: TinaTextStyle.heading6),
                SizedBox(height: 4),
                TinaText('Software Engineer', style: TinaTextStyle.body),
                SizedBox(height: 4),
                TinaText(
                  'john.doe@example.com',
                  style: TinaTextStyle.bodySmall,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
