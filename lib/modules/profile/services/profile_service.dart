import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/rpc_client.dart';
import '../models/user_profile_model.dart';

class ProfileService {
  final RpcClient rpcClient;

  ProfileService({required this.rpcClient});

  Future<ApiResponse<UserProfileModel>> getUserProfile([int? id]) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.userDetail,
      params: id != null ? {'id': id} : {},
    );

    return ApiResponse<UserProfileModel>.fromJson(
      responseMap,
      (data) => UserProfileModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<UserProfileModel>> updateUserProfile({
    required int id,
    required String name,
    required String email,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.userUpdate,
      params: {
        'id': id,
        'name': name,
        'email': email,
      },
    );

    return ApiResponse<UserProfileModel>.fromJson(
      responseMap,
      (data) => UserProfileModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
