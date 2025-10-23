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
          TinaText(style: TinaTextStyle.heading6, child: Text('Card Title')),
          SizedBox(height: 8),
          TinaText(
            style: TinaTextStyle.body,
            child: Text(
              'This is a basic card with some content inside it. Cards are great for organizing information.',
            ),
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
          const TinaText(
            style: TinaTextStyle.heading5,
            child: Text('Card Elevations'),
          ),
          const SizedBox(height: 24),
          TinaCard(
            child: const TinaText(
              style: TinaTextStyle.body,
              child: Text('No Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: const TinaText(
              style: TinaTextStyle.body,
              child: Text('Small Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: const TinaText(
              style: TinaTextStyle.body,
              child: Text('Medium Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: const TinaText(
              style: TinaTextStyle.body,
              child: Text('Large Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: const TinaText(
              style: TinaTextStyle.body,
              child: Text('Extra Large Elevation'),
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
            style: TinaTextStyle.heading5,
            child: Text('Card Padding Variants'),
          ),
          const SizedBox(height: 24),
          TinaCard.noPadding(
            child: Container(
              color: Colors.blue.withValues(alpha: 0.1),
              child: const TinaText(
                style: TinaTextStyle.body,
                child: Text('No Padding'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard.compact(
            child: Container(
              color: Colors.green.withValues(alpha: 0.1),
              child: const TinaText(
                style: TinaTextStyle.body,
                child: Text('Compact Padding'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard(
            child: Container(
              color: Colors.orange.withValues(alpha: 0.1),
              child: const TinaText(
                style: TinaTextStyle.body,
                child: Text('Medium Padding (Default)'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TinaCard.spacious(
            child: Container(
              color: Colors.purple.withValues(alpha: 0.1),
              child: const TinaText(
                style: TinaTextStyle.body,
                child: Text('Spacious Padding'),
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
          TinaText(style: TinaTextStyle.heading6, child: Text('Tap Me!')),
          SizedBox(height: 8),
          TinaText(
            style: TinaTextStyle.body,
            textAlign: TextAlign.center,
            child: Text(
              'This card is interactive. Tap it to see the response.',
            ),
          ),
        ],
      ),
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
              style: TinaTextStyle.heading6,
              child: Text('Card with Image Placeholder'),
            ),
            const SizedBox(height: 8),
            const TinaText(
              style: TinaTextStyle.body,
              child: Text(
                'This card demonstrates how to structure content with images, titles, and descriptions. Perfect for product cards or article previews.',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TinaText(
                  style: TinaTextStyle.heading6,
                  child: Text('\$29.99', style: TextStyle(color: Colors.green)),
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
          const TinaText(
            style: TinaTextStyle.heading6,
            child: Text('Settings'),
          ),
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
                      style: TinaTextStyle.body,
                      child: Text(
                        ['Profile', 'Notifications', 'Security', 'Help'][index],
                      ),
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
                TinaText(
                  style: TinaTextStyle.heading6,
                  child: Text('John Doe'),
                ),
                SizedBox(height: 4),
                TinaText(
                  style: TinaTextStyle.body,
                  child: Text('Software Engineer'),
                ),
                SizedBox(height: 4),
                TinaText(
                  style: TinaTextStyle.bodySmall,
                  child: Text(
                    'john.doe@example.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
