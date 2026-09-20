class SensorReadingModel {
  final int id;
  final int sensorId;
  final double soilMoisture;
  final double temperature;
  final double humidity;
  final DateTime? recordedAt;

  const SensorReadingModel({
    required this.id,
    required this.sensorId,
    required this.soilMoisture,
    required this.temperature,
    required this.humidity,
    this.recordedAt,
  });

  factory SensorReadingModel.fromJson(Map<String, dynamic> json) {
    return SensorReadingModel(
      id: json['id'] as int? ?? 0,
      sensorId: json['sensor_id'] as int? ?? 0,
      soilMoisture: (json['soil_moisture'] as num?)?.toDouble() ?? 0.0,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
      humidity: (json['humidity'] as num?)?.toDouble() ?? 0.0,
      recordedAt: json['recorded_at'] != null
          ? DateTime.tryParse(json['recorded_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sensor_id': sensorId,
      'soil_moisture': soilMoisture,
      'temperature': temperature,
      'humidity': humidity,
      if (recordedAt != null) 'recorded_at': recordedAt!.toIso8601String(),
    };
  }
}
