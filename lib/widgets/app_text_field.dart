import 'package:flutter/material.dart';
import '../utils/colorScheme.dart';

/// Reusable Text Field Component following TaniPintar design specifications.
/// 
/// Conforms to:
/// - Label: SemiBold (FontWeight.w600), 14sp, AppColors.textPrimary (#212121)
/// - Input Box: Fill color AppColors.inputBackground (#FAFAFA)
/// - Radius: BorderRadius.circular(10.0)
/// - Border: 1.0dp AppColors.border (#E0E0E0)
/// - Focused Border: 1.5dp AppColors.borderFocused (#1B5E20)
/// - Hint: Regular (FontWeight.w400), 14sp, AppColors.textHint (#9E9E9E)
/// - Spacing between label and input box: 8.0dp
class AppTextField extends StatelessWidget {
  /// The label displayed above the input box.
  final String label;

  /// Placeholder hint text inside the input box.
  final String? hintText;

  /// Optional prefix icon inside the text field.
  final IconData? prefixIcon;

  /// Optional custom prefix widget (overrides [prefixIcon] if provided).
  final Widget? prefix;

  /// Optional suffix widget (e.g. eye icon for password toggle).
  final Widget? suffixIcon;

  /// Text editing controller.
  final TextEditingController? controller;

  /// Whether the text is hidden (for passwords).
  final bool obscureText;

  /// Keyboard type (e.g. TextInputType.emailAddress).
  final TextInputType? keyboardType;

  /// Action button on keyboard (e.g. TextInputAction.next).
  final TextInputAction? textInputAction;

  /// Validation function.
  final String? Function(String?)? validator;

  /// Callback when text changes.
  final ValueChanged<String>? onChanged;

  /// Callback when submitted from keyboard.
  final ValueChanged<String>? onFieldSubmitted;

  /// Whether the field is enabled.
  final bool enabled;

  /// Max lines for the input. Defaults to 1.
  final int maxLines;

  /// Focus node for the field.
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),

        // Text Form Field
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          enabled: enabled,
          maxLines: maxLines,
          focusNode: focusNode,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: enabled ? AppColors.inputBackground : const Color(0xFFF0F0F0),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.textHint,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefix ??
                (prefixIcon != null
                    ? Icon(prefixIcon, color: AppColors.textSecondary, size: 20)
                    : null),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.border, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.border, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.borderFocused, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.error, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
