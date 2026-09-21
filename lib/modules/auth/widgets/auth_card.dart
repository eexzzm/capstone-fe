import 'package:flutter/material.dart';
import '../../../utils/colorScheme.dart';

/// Reusable Card Container for Authentication screens following authGuide.md:
/// - Main Card Container Radius: BorderRadius.circular(16.0)
/// - Card Background: White (#FFFFFF)
/// - Card Internal Padding: 24.0dp (All Sides)
/// - Elevation / Shadow: BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))
/// - Margin: 16.0dp horizontal padding
class AuthCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const AuthCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 460),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      padding: padding ?? const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
