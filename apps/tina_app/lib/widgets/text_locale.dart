import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextLocale extends StatelessWidget {
  const TextLocale(this.data, {super.key});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data.tr());
  }
}
