import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanipintar/utils/colorScheme.dart';
import 'package:tanipintar/widgets/app_button.dart';
import 'package:tanipintar/widgets/app_text_field.dart';
import 'package:tanipintar/modules/auth/widgets/auth_header.dart';
import 'package:tanipintar/modules/auth/widgets/auth_footer.dart';
import 'package:tanipintar/modules/auth/widgets/auth_card.dart';

void main() {
  group('AppColors & Theme Tests', () {
    test('Verifies color constants match authGuide.md specification', () {
      expect(AppColors.primary, const Color(0xFF1B5E20));
      expect(AppColors.primaryLight, const Color(0xFFE8F5E9));
      expect(AppColors.backgroundCanvas, const Color(0xFFF8F9FA));
      expect(AppColors.cardBackground, const Color(0xFFFFFFFF));
      expect(AppColors.inputBackground, const Color(0xFFFAFAFA));
      expect(AppColors.border, const Color(0xFFE0E0E0));
      expect(AppColors.borderFocused, const Color(0xFF1B5E20));
      expect(AppColors.textPrimary, const Color(0xFF212121));
      expect(AppColors.textSecondary, const Color(0xFF616161));
      expect(AppColors.textHint, const Color(0xFF9E9E9E));
      expect(AppColors.textOnPrimary, const Color(0xFFFFFFFF));
    });
  });

  group('Reusable AppButton Tests', () {
    testWidgets('Renders label text and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Daftar Sekarang',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Daftar Sekarang'), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('Renders icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Masuk',
              icon: Icons.login,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.login), findsOneWidget);
      expect(find.text('Masuk'), findsOneWidget);
    });

    testWidgets('Shows CircularProgressIndicator when isLoading is true and ignores taps', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Daftar',
              isLoading: true,
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Daftar'), findsNothing);

      await tester.tap(find.byType(AppButton));
      await tester.pump();
      expect(tapped, isFalse);
    });
  });

  group('Reusable AppTextField Tests', () {
    testWidgets('Renders label and hint text', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTextField(
              label: 'Nama Lengkap',
              hintText: 'Masukkan nama Anda',
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.text('Nama Lengkap'), findsOneWidget);
      expect(find.text('Masukkan nama Anda'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), 'Budi Santoso');
      await tester.pump();

      expect(controller.text, 'Budi Santoso');
    });

    testWidgets('Toggles obscure text when suffix icon pressed', (WidgetTester tester) async {
      bool obscure = true;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: AppTextField(
                  label: 'Kata Sandi',
                  obscureText: obscure,
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });

  group('Auth Header, Footer & Card Tests', () {
    testWidgets('AuthHeader displays title, subtitle, and badge icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuthHeader(
              title: 'Daftar Akun Baru',
              subtitle: 'Mari bergabung bersama TaniPintar',
              icon: Icons.eco,
            ),
          ),
        ),
      );

      expect(find.text('Daftar Akun Baru'), findsOneWidget);
      expect(find.text('Mari bergabung bersama TaniPintar'), findsOneWidget);
      expect(find.byIcon(Icons.eco), findsOneWidget);
    });

    testWidgets('AuthFooter displays prompt, action, and handles tap', (WidgetTester tester) async {
      bool clicked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthFooter(
              promptText: 'Sudah punya akun? ',
              actionText: 'Masuk di sini',
              onActionTap: () {
                clicked = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Sudah punya akun? '), findsOneWidget);
      expect(find.text('Masuk di sini'), findsOneWidget);

      await tester.tap(find.text('Masuk di sini'));
      await tester.pump();

      expect(clicked, isTrue);
    });

    testWidgets('AuthCard wraps child content with specified decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AuthCard(
              child: Text('Card Content'),
            ),
          ),
        ),
      );

      expect(find.text('Card Content'), findsOneWidget);
    });
  });
}
