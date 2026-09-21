import 'package:flutter_test/flutter_test.dart';
import 'package:tanipintar/main.dart';
import 'package:tanipintar/modules/auth/views/login_view.dart';

void main() {
  testWidgets('App smoke test initializes and displays LoginView', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify LoginView elements are rendered
    expect(find.byType(LoginView), findsOneWidget);
    expect(find.text('Masuk ke Akun'), findsOneWidget);
    expect(find.text('Masuk Sekarang'), findsOneWidget);
  });
}
