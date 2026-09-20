import '../../../core/network/api_response.dart';
import '../../../core/network/rpc_client.dart';
import '../models/home_dashboard_model.dart';

class HomeService {
  final RpcClient rpcClient;

  HomeService({required this.rpcClient});

  Future<ApiResponse<HomeDashboardModel>> getDashboardSummary() async {
    try {
      final responseMap = await rpcClient.call(
        procedure: '/dashboard/summary',
        params: {},
      );

      return ApiResponse<HomeDashboardModel>.fromJson(
        responseMap,
        (data) => HomeDashboardModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (_) {
      return const ApiResponse<HomeDashboardModel>(
        success: true,
        message: 'Dashboard placeholder data',
        data: HomeDashboardModel(),
      );
    }
  }
}
