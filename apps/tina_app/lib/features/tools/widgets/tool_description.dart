import 'package:flutter/material.dart';
import 'package:tina_app/i18n/locale_keys.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';
import 'package:tina_app/widgets/text_locale.dart';

class ToolDescriptionidget extends StatelessWidget {
  const ToolDescriptionidget({required this.toolType, super.key});
  final UserToolType toolType;

  @override
  Widget build(BuildContext context) {
    return TextLocale(switch (toolType) {
      UserToolType.calculator => LocaleKeys.tools_names_calculator_description,
    });
  }
}
