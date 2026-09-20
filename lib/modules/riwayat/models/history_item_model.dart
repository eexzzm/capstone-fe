class HistoryItemModel {
  final int id;
  final int sensorId;
  final String parameter;
  final DateTime? startedAt;
  final DateTime? lastDetectedAt;
  final int accumulatedDuration;
  final String status;
  final DateTime? resolvedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const HistoryItemModel({
    required this.id,
    required this.sensorId,
    required this.parameter,
    this.startedAt,
    this.lastDetectedAt,
    this.accumulatedDuration = 0,
    required this.status,
    this.resolvedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryItemModel.fromJson(Map<String, dynamic> json) {
    return HistoryItemModel(
      id: json['id'] as int? ?? 0,
      sensorId: json['sensor_id'] as int? ?? 0,
      parameter: json['parameter'] as String? ?? '',
      startedAt: json['started_at'] != null
          ? DateTime.tryParse(json['started_at'] as String)
          : null,
      lastDetectedAt: json['last_detected_at'] != null
          ? DateTime.tryParse(json['last_detected_at'] as String)
          : null,
      accumulatedDuration: json['accumulated_duration'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      resolvedAt: json['resolved_at'] != null
          ? DateTime.tryParse(json['resolved_at'] as String)
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sensor_id': sensorId,
      'parameter': parameter,
      if (startedAt != null) 'started_at': startedAt!.toIso8601String(),
      if (lastDetectedAt != null)
        'last_detected_at': lastDetectedAt!.toIso8601String(),
      'accumulated_duration': accumulatedDuration,
      'status': status,
      if (resolvedAt != null) 'resolved_at': resolvedAt!.toIso8601String(),
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  String get formattedDuration {
    if (accumulatedDuration < 60) {
      return '$accumulatedDuration dtk';
    }
    final minutes = (accumulatedDuration / 60).floor();
    if (minutes < 60) {
      return '$minutes mnt';
    }
    final hours = (minutes / 60).floor();
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '$hours jam';
    }
    return '$hours j $remainingMinutes m';
  }
}
