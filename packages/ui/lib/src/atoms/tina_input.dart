import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../tokens/design_tokens.dart';

/// A customizable input field component following the Tina design system.
///
/// This input field supports multiple sizes, validation states, and provides
/// consistent styling across the application.
class TinaInput extends StatefulWidget {
  /// Creates a Tina input field.
  const TinaInput({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.helperText,
    this.errorText,
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
  }) : assert(
         controller == null || initialValue == null,
         'Cannot provide both controller and initialValue',
       );

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The initial value of the input field.
  final String? initialValue;

  /// Placeholder text to display when the input is empty.
  final String? placeholder;

  /// Helper text to display below the input.
  final String? helperText;

  /// Error text to display below the input.
  final String? errorText;

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

  /// Whether this input field should focus itself if nothing else is already focused.
  final bool autofocus;

  /// The maximum number of lines to show at one time.
  final int maxLines;

  /// The maximum number of characters allowed in the input.
  final int? maxLength;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Called when the user changes the text in the field.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates that they are done editing the text in the field.
  final ValueChanged<String>? onSubmitted;

  /// Called when the input field is tapped.
  final VoidCallback? onTap;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// A semantic label for the input field.
  final String? semanticLabel;

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
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: _getHeight(),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            border: Border.all(
              color: _getBorderColor(),
              width: DesignBorderWidth.thin,
            ),
            borderRadius: BorderRadius.circular(DesignBorderRadius.md),
            boxShadow: _isFocused && widget.state != TinaInputState.error
                ? [
                    BoxShadow(
                      color: DesignColors.primaryBase.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                      spreadRadius: 3,
                    ),
                  ]
                : null,
          ),
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
            style: _getTextStyle(),
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: _getHintStyle(),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              contentPadding: _getPadding(),
              border: InputBorder.none,
              counterText: '',
              semanticCounterText: widget.semanticLabel,
            ),
          ),
        ),
        if (widget.errorText != null || widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(
              top: DesignSpacing.xs,
              left: DesignSpacing.sm,
            ),
            child: Text(
              widget.errorText ?? widget.helperText!,
              style: TextStyle(
                fontFamily: DesignTypography.bodyFontFamily,
                fontSize: DesignTypography.fontSizeXs,
                fontWeight: DesignTypography.fontWeightRegular,
                height: DesignTypography.lineHeightXs,
                color: widget.errorText != null
                    ? DesignColors.error
                    : DesignColors.neutral500,
              ),
            ),
          ),
      ],
    );
  }

  double _getHeight() {
    return switch (widget.size) {
      TinaInputSize.small => DesignInputSizes.heightSm,
      TinaInputSize.medium => DesignInputSizes.heightMd,
      TinaInputSize.large => DesignInputSizes.heightLg,
    };
  }

  EdgeInsets _getPadding() {
    return switch (widget.size) {
      TinaInputSize.small => DesignInputSizes.paddingSm,
      TinaInputSize.medium => DesignInputSizes.paddingMd,
      TinaInputSize.large => DesignInputSizes.paddingLg,
    };
  }

  Color _getBackgroundColor() {
    if (!widget.enabled) return DesignColors.neutral100;
    if (widget.readOnly) return DesignColors.neutral50;
    return Colors.white;
  }

  Color _getBorderColor() {
    if (!widget.enabled) return DesignColors.neutral200;
    
    return switch (widget.state) {
      TinaInputState.normal => _isFocused 
          ? DesignColors.primaryBase 
          : DesignColors.neutral300,
      TinaInputState.success => DesignColors.success,
      TinaInputState.warning => DesignColors.warning,
      TinaInputState.error => DesignColors.error,
    };
  }

  TextStyle _getTextStyle() {
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
      color: widget.enabled ? DesignColors.neutral900 : DesignColors.neutral500,
    );
  }

  TextStyle _getHintStyle() {
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
      color: DesignColors.neutral400,
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