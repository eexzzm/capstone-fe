import 'package:flutter/foundation.dart';
import '../models/home_dashboard_model.dart';
import '../services/home_service.dart';

class HomeProvider extends ChangeNotifier {
  final HomeService homeService;

  HomeProvider({required this.homeService});

  bool _isLoading = false;
  String? _errorMessage;
  HomeDashboardModel _dashboardData = const HomeDashboardModel();

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  HomeDashboardModel get dashboardData => _dashboardData;

  Future<void> fetchDashboardSummary() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await homeService.getDashboardSummary();
      if (response.success && response.data != null) {
        _dashboardData = response.data!;
      } else {
        _errorMessage = response.message;
      }
    } catch (e) {
      _errorMessage = 'Gagal memuat ringkasan dashboard: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
