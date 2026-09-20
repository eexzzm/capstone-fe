import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/rpc_client.dart';
import '../models/auth_model.dart';

class AuthService {
  final RpcClient rpcClient;

  AuthService({required this.rpcClient});

  Future<ApiResponse<AuthResponseData>> login(LoginRequest request) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.authLogin,
      params: request.toJson(),
    );

    return ApiResponse<AuthResponseData>.fromJson(
      responseMap,
      (data) => AuthResponseData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<AuthResponseData>> register(RegisterRequest request) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.authRegister,
      params: request.toJson(),
    );

    return ApiResponse<AuthResponseData>.fromJson(
      responseMap,
      (data) => AuthResponseData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<void>> logout() async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.authLogout,
      params: {},
    );

    return ApiResponse<void>.fromJson(responseMap, null);
  }
}
