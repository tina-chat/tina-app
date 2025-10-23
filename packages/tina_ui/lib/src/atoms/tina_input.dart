import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tina_ui/src/atoms/tina_field_wrapper.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable input field component following the Tina design system.
///
/// This input field supports multiple sizes, validation states, and provides
/// consistent styling across the application by using the TinaFieldWrapper.
class TinaInput extends StatefulWidget {
  /// Creates a Tina input field.
  const TinaInput({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.label,
    this.hint,
    this.error,
    this.isRequired = false,
    this.prefixIcon,
    this.suffixIcon,
    this.size = TinaInputSize.medium,
    this.state = TinaInputState.normal,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.semanticLabel,
    this.footer,
  }) : assert(
         controller == null || initialValue == null,
         'Cannot provide both controller and initialValue',
       );

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The initial value of the input field.
  final String? initialValue;

  /// Placeholder text to display when the input is empty.
  final Widget? placeholder;

  /// Optional label text to display above the field.
  final Widget? label;

  /// Optional hint text to display below the field.
  final Widget? hint;

  /// Optional error text to display below the field.
  final Widget? error;

  /// Whether the field is required.
  final bool isRequired;

  /// Widget to display before the input text.
  final Widget? prefixIcon;

  /// Widget to display after the input text.
  final Widget? suffixIcon;

  /// The size of the input field.
  final TinaInputSize size;

  /// The visual state of the input field.
  final TinaInputState state;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// Whether to hide the text being edited.
  final bool obscureText;

  /// Whether the input field is enabled.
  final bool enabled;

  /// Whether the input field is read-only.
  final bool readOnly;

  /// Whether this input field should focus itself if nothing else is already
  /// focused.
  final bool autofocus;

  /// The maximum number of lines to show at one time.
  final int maxLines;

  /// The maximum number of characters allowed in the input.
  final int? maxLength;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Called when the user changes the text in the field.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates that they are done editing the text in the
  /// field.
  final ValueChanged<String>? onSubmitted;

  /// Called when the input field is tapped.
  final VoidCallback? onTap;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// A semantic label for the input field.
  final String? semanticLabel;

  ///
  final Widget? footer;

  @override
  State<TinaInput> createState() => _TinaInputState();
}

class _TinaInputState extends State<TinaInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final fieldState = _convertToFieldState(widget.state);

    return TinaFieldWrapper(
      label: widget.label,
      hint: widget.hint,
      error: widget.error,
      isRequired: widget.isRequired,

      state: fieldState,
      isEnabled: widget.enabled,
      isReadOnly: widget.readOnly,
      isFocused: _isFocused,
      semanticLabel: widget.semanticLabel,
      child: Padding(
        padding: _getPadding(),
        child: Column(
          children: [
            Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  widget.prefixIcon!,
                  const SizedBox(width: DesignSpacing.sm),
                ],
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    initialValue: widget.initialValue,
                    focusNode: _focusNode,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    obscureText: widget.obscureText,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    autofocus: widget.autofocus,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    inputFormatters: widget.inputFormatters,
                    onChanged: widget.onChanged,
                    onFieldSubmitted: widget.onSubmitted,
                    onTap: widget.onTap,
                    style: _getTextStyle(tinaColors),
                    decoration: InputDecoration(
                      hint: widget.placeholder,
                      hintStyle: _getHintStyle(tinaColors),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      semanticCounterText: widget.semanticLabel,
                      isDense: false,
                    ),
                  ),
                ),
                if (widget.suffixIcon != null) ...[
                  const SizedBox(width: DesignSpacing.sm),
                  widget.suffixIcon!,
                ],
              ],
            ),
            if (widget.footer != null) widget.footer!,
          ],
        ),
      ),
    );
  }

  TinaFieldState _convertToFieldState(TinaInputState state) {
    return switch (state) {
      TinaInputState.normal => TinaFieldState.normal,
      TinaInputState.success => TinaFieldState.success,
      TinaInputState.warning => TinaFieldState.warning,
      TinaInputState.error => TinaFieldState.error,
    };
  }

  EdgeInsets _getPadding() {
    return switch (widget.size) {
      TinaInputSize.small => DesignInputSizes.paddingSm,
      TinaInputSize.medium => DesignInputSizes.paddingMd,
      TinaInputSize.large => DesignInputSizes.paddingLg,
    };
  }

  TextStyle _getTextStyle(TinaColorScheme colors) {
    final fontSize = switch (widget.size) {
      TinaInputSize.small => DesignTypography.fontSizeSm,
      TinaInputSize.medium => DesignTypography.fontSizeBase,
      TinaInputSize.large => DesignTypography.fontSizeLg,
    };

    return TextStyle(
      fontFamily: DesignTypography.bodyFontFamily,
      fontSize: fontSize,
      fontWeight: DesignTypography.fontWeightRegular,
      height: DesignTypography.lineHeightBase,
      color: widget.enabled ? colors.onSurface : colors.onSurfaceVariant,
    );
  }

  TextStyle _getHintStyle(TinaColorScheme colors) {
    final fontSize = switch (widget.size) {
      TinaInputSize.small => DesignTypography.fontSizeSm,
      TinaInputSize.medium => DesignTypography.fontSizeBase,
      TinaInputSize.large => DesignTypography.fontSizeLg,
    };

    return TextStyle(
      fontFamily: DesignTypography.bodyFontFamily,
      fontSize: fontSize,
      fontWeight: DesignTypography.fontWeightRegular,
      height: DesignTypography.lineHeightBase,
      color: colors.onSurfaceVariant.withValues(alpha: 0.7),
    );
  }
}

/// The size of a [TinaInput].
enum TinaInputSize {
  /// A small input field.
  small,

  /// A medium input field (default).
  medium,

  /// A large input field.
  large,
}

/// The visual state of a [TinaInput].
enum TinaInputState {
  /// Normal state.
  normal,

  /// Success state (green border).
  success,

  /// Warning state (yellow border).
  warning,

  /// Error state (red border).
  error,
}
