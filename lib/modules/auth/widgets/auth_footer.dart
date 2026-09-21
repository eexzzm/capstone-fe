import 'package:flutter/material.dart';
import '../../../utils/colorScheme.dart';

/// Reusable Footer Link for switching between Login and Register.
/// 
/// Conforms to:
/// - Spacing above: 20.0dp from Submit Button
/// - Prompt text: Regular (FontWeight.w400), 14sp, AppColors.textSecondary (#616161)
/// - Action text: Bold (FontWeight.w700), 14sp, AppColors.primary (#1B5E20)
/// - Responsive: Uses Wrap to avoid overflow on narrow screens.
class AuthFooter extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthFooter({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              promptText,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: onActionTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Text(
                  actionText,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
