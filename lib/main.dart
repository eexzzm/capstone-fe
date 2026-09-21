import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/auth/views/login_view.dart';
import 'modules/auth/views/register_view.dart';
import 'modules/navigation/views/main_screen.dart';
import 'utils/app_providers.dart';
import 'utils/colorScheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String baseUrl;

  const MyApp({
    super.key,
    this.baseUrl = 'http://localhost:8000',
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.buildProviders(
        baseUrl: baseUrl,
      ),
      child: MaterialApp(
        title: 'TaniPintar',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: LoginView.routeName,
        routes: {
          LoginView.routeName: (_) => const LoginView(),
          RegisterView.routeName: (_) => const RegisterView(),
          '/main': (_) => const MainScreen(),
        },
      ),
    );
  }
}
