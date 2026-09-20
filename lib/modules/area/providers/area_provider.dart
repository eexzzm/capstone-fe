import 'package:flutter/foundation.dart';
import '../../../core/network/rpc_client.dart';
import '../models/area_model.dart';
import '../models/sensor_model.dart';
import '../services/area_service.dart';
import '../services/sensor_service.dart';

class AreaProvider extends ChangeNotifier {
  final AreaService areaService;
  final SensorService sensorService;

  AreaProvider({
    required this.areaService,
    required this.sensorService,
  });

  bool _isLoading = false;
  bool _isSaving = false;
  bool _isDeleting = false;
  String? _errorMessage;

  List<AreaModel> _areas = [];
  AreaModel? _selectedArea;
  int _totalAreas = 0;

  List<SensorModel> _sensors = [];
  SensorModel? _selectedSensor;
  int _totalSensors = 0;

  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  bool get isDeleting => _isDeleting;
  String? get errorMessage => _errorMessage;

  List<AreaModel> get areas => _areas;
  AreaModel? get selectedArea => _selectedArea;
  int get totalAreas => _totalAreas;

  List<SensorModel> get sensors => _sensors;
  SensorModel? get selectedSensor => _selectedSensor;
  int get totalSensors => _totalSensors;

  void selectArea(AreaModel? area) {
    _selectedArea = area;
    notifyListeners();
    if (area != null) {
      fetchSensors(areaId: area.id);
    }
  }

  void selectSensor(SensorModel? sensor) {
    _selectedSensor = sensor;
    notifyListeners();
  }

  Future<void> fetchAreas({int limit = 20, int index = 0}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await areaService.getAreaList(limit: limit, index: index);
      if (response.success && response.data != null) {
        _areas = response.data!.data;
        _totalAreas = response.data!.total;
      } else {
        _errorMessage = response.message;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
    } catch (e) {
      _errorMessage = 'Gagal memuat data lahan: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> fetchAreaDetail(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await areaService.getAreaDetail(id);
      if (response.success && response.data != null) {
        _selectedArea = response.data;
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
      _errorMessage = 'Gagal memuat detail lahan: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> createArea({
    required String name,
    String? description,
    String? location,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await areaService.createArea(
        name: name,
        description: description,
        location: location,
      );

      if (response.success && response.data != null) {
        _areas.insert(0, response.data!);
        _totalAreas++;
        _isSaving = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isSaving = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal menambahkan lahan: $e';
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateArea({
    required int id,
    required String name,
    String? description,
    String? location,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await areaService.updateArea(
        id: id,
        name: name,
        description: description,
        location: location,
      );

      if (response.success && response.data != null) {
        final idx = _areas.indexWhere((a) => a.id == id);
        if (idx >= 0) {
          _areas[idx] = response.data!;
        }
        if (_selectedArea?.id == id) {
          _selectedArea = response.data;
        }
        _isSaving = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isSaving = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal memperbarui lahan: $e';
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteArea(int id) async {
    _isDeleting = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await areaService.deleteArea(id);
      if (response.success) {
        _areas.removeWhere((a) => a.id == id);
        _totalAreas = (_totalAreas - 1).clamp(0, double.infinity).toInt();
        if (_selectedArea?.id == id) {
          _selectedArea = null;
        }
        _isDeleting = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isDeleting = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isDeleting = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal menghapus lahan: $e';
      _isDeleting = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchSensors({int? areaId, int limit = 20, int index = 0}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await sensorService.getSensorList(
        areaId: areaId,
        limit: limit,
        index: index,
      );

      if (response.success && response.data != null) {
        _sensors = response.data!.data;
        _totalSensors = response.data!.total;
      } else {
        _errorMessage = response.message;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
    } catch (e) {
      _errorMessage = 'Gagal memuat sensor: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createSensor({
    required String name,
    required String code,
    required int areaId,
    String? description,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await sensorService.createSensor(
        name: name,
        code: code,
        areaId: areaId,
        description: description,
      );

      if (response.success && response.data != null) {
        _sensors.insert(0, response.data!);
        _totalSensors++;
        _isSaving = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isSaving = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal mendaftarkan sensor: $e';
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateSensor({
    required int id,
    required String name,
    required String code,
    required int areaId,
    String? description,
  }) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await sensorService.updateSensor(
        id: id,
        name: name,
        code: code,
        areaId: areaId,
        description: description,
      );

      if (response.success && response.data != null) {
        final idx = _sensors.indexWhere((s) => s.id == id);
        if (idx >= 0) {
          _sensors[idx] = response.data!;
        }
        if (_selectedSensor?.id == id) {
          _selectedSensor = response.data;
        }
        _isSaving = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isSaving = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal memperbarui sensor: $e';
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteSensor(int id) async {
    _isDeleting = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await sensorService.deleteSensor(id);
      if (response.success) {
        _sensors.removeWhere((s) => s.id == id);
        _totalSensors = (_totalSensors - 1).clamp(0, double.infinity).toInt();
        if (_selectedSensor?.id == id) {
          _selectedSensor = null;
        }
        _isDeleting = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message;
        _isDeleting = false;
        notifyListeners();
        return false;
      }
    } on RpcException catch (e) {
      _errorMessage = e.toString();
      _isDeleting = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Gagal menghapus sensor: $e';
      _isDeleting = false;
      notifyListeners();
      return false;
    }
  }
}
