import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Card', type: AuraCard)
Widget basicCardUseCase(BuildContext context) {
  return Center(
    child: AuraCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AuraText(style: AuraTextStyle.heading6, child: Text('Card Title')),
          SizedBox(height: 8),
          AuraText(
            style: AuraTextStyle.body,
            child: Text(
              'This is a basic card with some content inside it. Cards are great for organizing information.',
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Card Elevations', type: AuraCard)
Widget cardElevationsUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuraText(
            style: AuraTextStyle.heading5,
            child: Text('Card Elevations'),
          ),
          const SizedBox(height: 24),
          AuraCard(
            child: const AuraText(
              style: AuraTextStyle.body,
              child: Text('No Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard(
            child: const AuraText(
              style: AuraTextStyle.body,
              child: Text('Small Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard(
            child: const AuraText(
              style: AuraTextStyle.body,
              child: Text('Medium Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard(
            child: const AuraText(
              style: AuraTextStyle.body,
              child: Text('Large Elevation'),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard(
            child: const AuraText(
              style: AuraTextStyle.body,
              child: Text('Extra Large Elevation'),
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Card Padding Variants', type: AuraCard)
Widget cardPaddingVariantsUseCase(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuraText(
            style: AuraTextStyle.heading5,
            child: Text('Card Padding Variants'),
          ),
          const SizedBox(height: 24),
          AuraCard.noPadding(
            child: Container(
              color: Colors.blue.withValues(alpha: 0.1),
              child: const AuraText(
                style: AuraTextStyle.body,
                child: Text('No Padding'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard.compact(
            child: Container(
              color: Colors.green.withValues(alpha: 0.1),
              child: const AuraText(
                style: AuraTextStyle.body,
                child: Text('Compact Padding'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard(
            child: Container(
              color: Colors.orange.withValues(alpha: 0.1),
              child: const AuraText(
                style: AuraTextStyle.body,
                child: Text('Medium Padding (Default)'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AuraCard.spacious(
            child: Container(
              color: Colors.purple.withValues(alpha: 0.1),
              child: const AuraText(
                style: AuraTextStyle.body,
                child: Text('Spacious Padding'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Interactive Card', type: AuraCard)
Widget interactiveCardUseCase(BuildContext context) {
  return Center(
    child: AuraCard(
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
          AuraText(style: AuraTextStyle.heading6, child: Text('Tap Me!')),
          SizedBox(height: 8),
          AuraText(
            style: AuraTextStyle.body,
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

@widgetbook.UseCase(name: 'Content Card', type: AuraCard)
Widget contentCardUseCase(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 320,
      child: AuraCard(
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
            const AuraText(
              style: AuraTextStyle.heading6,
              child: Text('Card with Image Placeholder'),
            ),
            const SizedBox(height: 8),
            const AuraText(
              style: AuraTextStyle.body,
              child: Text(
                'This card demonstrates how to structure content with images, titles, and descriptions. Perfect for product cards or article previews.',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AuraText(
                  style: AuraTextStyle.heading6,
                  child: Text('\$29.99', style: TextStyle(color: Colors.green)),
                ),
                AuraButton(
                  onPressed: () {},
                  variant: AuraButtonVariant.primary,
                  size: AuraButtonSize.small,
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

@widgetbook.UseCase(name: 'List Card', type: AuraCard)
Widget listCardUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: AuraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuraText(
            style: AuraTextStyle.heading6,
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
                    child: AuraText(
                      style: AuraTextStyle.body,
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

@widgetbook.UseCase(name: 'Semantic Card', type: AuraCard)
Widget semanticCardUseCase(BuildContext context) {
  return Center(
    child: AuraCard(
      semanticLabel: 'User profile card for John Doe',
      child: Row(
        children: [
          AuraAvatar.initials(initials: 'JD', size: AuraAvatarSize.large),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AuraText(
                  style: AuraTextStyle.heading6,
                  child: Text('John Doe'),
                ),
                SizedBox(height: 4),
                AuraText(
                  style: AuraTextStyle.body,
                  child: Text('Software Engineer'),
                ),
                SizedBox(height: 4),
                AuraText(
                  style: AuraTextStyle.bodySmall,
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
