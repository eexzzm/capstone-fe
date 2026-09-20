import 'package:flutter/foundation.dart';
import '../../../core/network/rpc_client.dart';
import '../models/auth_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService;

  AuthProvider({required this.authService});

  bool _isLoading = false;
  String? _errorMessage;
  String? _accessToken;
  String? _refreshToken;
  UserAuthModel? _currentUser;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  UserAuthModel? get currentUser => _currentUser;
  bool get isAuthenticated => _accessToken != null && _accessToken!.isNotEmpty;

  void setToken(String? token, {String? refreshToken}) {
    _accessToken = token;
    _refreshToken = refreshToken;
    notifyListeners();
  }

  void setCurrentUser(UserAuthModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await authService.login(
        LoginRequest(email: email, password: password),
      );

      if (response.success && response.data != null) {
        _accessToken = response.data!.accessToken;
        _refreshToken = response.data!.refreshToken;
        _currentUser = response.data!.user;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Terjadi kesalahan tidak terduga: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await authService.register(
        RegisterRequest(name: name, email: email, password: password),
      );

      if (response.success && response.data != null) {
        _accessToken = response.data!.accessToken;
        _refreshToken = response.data!.refreshToken;
        _currentUser = response.data!.user;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Terjadi kesalahan tidak terduga: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await authService.logout();
    } catch (_) {
    } finally {
      _accessToken = null;
      _refreshToken = null;
      _currentUser = null;
      _isLoading = false;
      notifyListeners();
    }

    return true;
  }
}
