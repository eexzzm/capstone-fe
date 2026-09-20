import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/rpc_client.dart';
import '../models/area_model.dart';

class AreaService {
  final RpcClient rpcClient;

  AreaService({required this.rpcClient});

  Future<ApiResponse<PaginatedData<AreaModel>>> getAreaList({
    int limit = 20,
    int index = 0,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.areaList,
      params: {
        'limit': limit,
        'index': index,
      },
    );

    return ApiResponse<PaginatedData<AreaModel>>.fromJson(
      responseMap,
      (data) => PaginatedData<AreaModel>.fromJson(
        data as Map<String, dynamic>,
        (item) => AreaModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<AreaModel>> getAreaDetail(int id) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.areaDetail,
      params: {'id': id},
    );

    return ApiResponse<AreaModel>.fromJson(
      responseMap,
      (data) => AreaModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<AreaModel>> createArea({
    required String name,
    String? description,
    String? location,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.areaCreate,
      params: {
        'name': name,
        if (description != null) 'description': description,
        if (location != null) 'location': location,
      },
    );

    return ApiResponse<AreaModel>.fromJson(
      responseMap,
      (data) => AreaModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<AreaModel>> updateArea({
    required int id,
    required String name,
    String? description,
    String? location,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.areaUpdate,
      params: {
        'id': id,
        'name': name,
        if (description != null) 'description': description,
        if (location != null) 'location': location,
      },
    );

    return ApiResponse<AreaModel>.fromJson(
      responseMap,
      (data) => AreaModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<void>> deleteArea(int id) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.areaDelete,
      params: {'id': id},
    );

    return ApiResponse<void>.fromJson(responseMap, null);
  }
}
