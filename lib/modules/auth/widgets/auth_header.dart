import 'package:flutter/material.dart';
import '../../../utils/colorScheme.dart';

/// Top Navigation bar with "Kembali" button following authGuide.md:
/// - Header Nav ("Kembali"): Bold (FontWeight.w700), 16sp, AppColors.primary (#1B5E20)
/// - Row (Icon.arrow_back + Text("Kembali"))
class AuthTopNav extends StatelessWidget {
  final VoidCallback? onBack;

  const AuthTopNav({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: onBack ??
                () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Kembali',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Centered Header badge, title, and subtitle inside the Auth Card.
/// 
/// Conforms to:
/// - Logo Badge Circle: Diameter 64dp, BoxShape.circle, AppColors.primaryLight (#E8F5E9)
/// - Leaf Icon: AppColors.primary (#1B5E20), size 32dp
/// - Vertical spacing icon to title: 16.0dp
/// - Title: Bold (FontWeight.w800), 22sp, AppColors.primary, height 1.2
/// - Vertical spacing title to subtitle: 8.0dp
/// - Subtitle: Regular (FontWeight.w400), 14sp, AppColors.textSecondary, height 1.4
/// - Vertical spacing subtitle to first input: 24.0dp
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.eco_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo Badge Circle
        Container(
          width: 64.0,
          height: 64.0,
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 32.0,
            ),
          ),
        ),
        const SizedBox(height: 16.0),

        // Page Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8.0),

        // Subtitle Description
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
