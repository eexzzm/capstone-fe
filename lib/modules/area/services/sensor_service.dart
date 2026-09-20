import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/rpc_client.dart';
import '../models/sensor_model.dart';

class SensorService {
  final RpcClient rpcClient;

  SensorService({required this.rpcClient});

  Future<ApiResponse<PaginatedData<SensorModel>>> getSensorList({
    int? areaId,
    int limit = 20,
    int index = 0,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.sensorList,
      params: {
        if (areaId != null) 'area_id': areaId,
        'limit': limit,
        'index': index,
      },
    );

    return ApiResponse<PaginatedData<SensorModel>>.fromJson(
      responseMap,
      (data) => PaginatedData<SensorModel>.fromJson(
        data as Map<String, dynamic>,
        (item) => SensorModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<SensorModel>> getSensorDetail(int id) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.sensorDetail,
      params: {'id': id},
    );

    return ApiResponse<SensorModel>.fromJson(
      responseMap,
      (data) => SensorModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<SensorModel>> createSensor({
    required String name,
    required String code,
    required int areaId,
    String? description,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.sensorCreate,
      params: {
        'name': name,
        'code': code,
        'area_id': areaId,
        if (description != null) 'description': description,
      },
    );

    return ApiResponse<SensorModel>.fromJson(
      responseMap,
      (data) => SensorModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<SensorModel>> updateSensor({
    required int id,
    required String name,
    required String code,
    required int areaId,
    String? description,
  }) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.sensorUpdate,
      params: {
        'id': id,
        'name': name,
        'code': code,
        'area_id': areaId,
        if (description != null) 'description': description,
      },
    );

    return ApiResponse<SensorModel>.fromJson(
      responseMap,
      (data) => SensorModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<void>> deleteSensor(int id) async {
    final responseMap = await rpcClient.call(
      procedure: ApiEndpoints.sensorDelete,
      params: {'id': id},
    );

    return ApiResponse<void>.fromJson(responseMap, null);
  }
}
