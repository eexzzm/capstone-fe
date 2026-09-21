import 'package:flutter/material.dart';
import '../utils/colorScheme.dart';

/// Reusable Button Component following TaniPintar design specifications.
/// 
/// Conforms to:
/// - Radius: BorderRadius.circular(12.0)
/// - Background: AppColors.primary (#1B5E20)
/// - Text: White, Bold (FontWeight.w700), 16sp
/// - Elevation: Flat or subtle depth (elevation 1.0)
class AppButton extends StatelessWidget {
  /// The text displayed inside the button.
  final String text;

  /// Callback executed when the button is pressed. If null or [isLoading] is true,
  /// the button is disabled.
  final VoidCallback? onPressed;

  /// If true, displays a progress spinner and disables interactions.
  final bool isLoading;

  /// Optional icon placed before the text label.
  final IconData? icon;

  /// Optional icon placed after the text label.
  final IconData? suffixIcon;

  /// Whether the button should expand to fill the full available width.
  final bool isFullWidth;

  /// Custom height of the button. Defaults to 50.0.
  final double height;

  /// Custom background color. Defaults to [AppColors.primary].
  final Color? backgroundColor;

  /// Custom text and icon color. Defaults to [AppColors.textOnPrimary].
  final Color? textColor;

  /// Custom font size. Defaults to 16.0.
  final double fontSize;

  /// Custom font weight. Defaults to FontWeight.w700.
  final FontWeight fontWeight;

  /// Custom border radius. Defaults to 12.0.
  final double borderRadius;

  /// Button elevation. Defaults to 1.0.
  final double elevation;

  /// If true, renders an outlined border button instead of a solid filled button.
  final bool isOutlined;

  /// Optional custom padding.
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.suffixIcon,
    this.isFullWidth = true,
    this.height = 50.0,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 12.0,
    this.elevation = 1.0,
    this.isOutlined = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = isOutlined
        ? Colors.transparent
        : (backgroundColor ?? AppColors.primary);
    final effectiveTextColor = isOutlined
        ? (backgroundColor ?? AppColors.primary)
        : (textColor ?? AppColors.textOnPrimary);
    final effectiveBorderSide = isOutlined
        ? BorderSide(color: backgroundColor ?? AppColors.primary, width: 1.5)
        : BorderSide.none;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: effectiveBorderSide,
    );

    Widget content;
    if (isLoading) {
      content = SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
        ),
      );
    } else {
      final children = <Widget>[];

      if (icon != null) {
        children.add(Icon(icon, size: 20, color: effectiveTextColor));
        children.add(const SizedBox(width: 10));
      }

      children.add(
        Text(
          text,
          style: TextStyle(
            color: effectiveTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: 0.2,
          ),
        ),
      );

      if (suffixIcon != null) {
        children.add(const SizedBox(width: 10));
        children.add(Icon(suffixIcon, size: 20, color: effectiveTextColor));
      }

      content = Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: effectiveBgColor,
      foregroundColor: effectiveTextColor,
      elevation: isOutlined ? 0 : elevation,
      shadowColor: AppColors.primary.withValues(alpha: 0.3),
      shape: shape,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      disabledBackgroundColor: isOutlined
          ? Colors.transparent
          : (backgroundColor ?? AppColors.primary).withValues(alpha: 0.6),
      disabledForegroundColor: effectiveTextColor.withValues(alpha: 0.7),
    );

    final buttonWidget = SizedBox(
      height: height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: isLoading ? null : onPressed,
        child: content,
      ),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }
}
