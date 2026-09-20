import 'package:flutter/foundation.dart';
import '../../../core/network/rpc_client.dart';
import '../models/user_profile_model.dart';
import '../services/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService profileService;

  ProfileProvider({required this.profileService});

  bool _isLoading = false;
  bool _isUpdating = false;
  String? _errorMessage;
  UserProfileModel? _userProfile;

  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  String? get errorMessage => _errorMessage;
  UserProfileModel? get userProfile => _userProfile;

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> fetchProfile([int? id]) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await profileService.getUserProfile(id);
      if (response.success && response.data != null) {
        _userProfile = response.data;
      } else {
        _errorMessage = response.message;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
    } catch (e) {
      _errorMessage = 'Gagal memuat profil pengguna: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProfile({
    required int id,
    required String name,
    required String email,
  }) async {
    _isUpdating = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await profileService.updateUserProfile(
        id: id,
        name: name,
        email: email,
      );

      if (response.success && response.data != null) {
        _userProfile = response.data;
        _isUpdating = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isUpdating = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isUpdating = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal memperbarui profil: $e';
      _isUpdating = false;
      notifyListeners();
      return false;
    }
  }
}
