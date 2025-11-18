import 'package:auravibes_app/i18n/locale_keys.dart';
import 'package:auravibes_app/widgets/text_locale.dart';
import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A reusable widget for displaying model provider logos
class ModelLogo extends StatelessWidget {
  const ModelLogo({
    required this.modelId,
    this.height = 20,
    this.width,
    super.key,
  });

  final String modelId;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      'https://models.dev/logos/$modelId.svg',
      height: height,
      width: width,
      placeholderBuilder: (context) {
        return const AuraSpinner();
      },
      errorBuilder: (context, error, stackTrace) {
        return const AuraText(
          child: TextLocale(
            LocaleKeys.models_screens_add_provider_search_no_icon,
          ),
        );
      },
    );
  }
}
