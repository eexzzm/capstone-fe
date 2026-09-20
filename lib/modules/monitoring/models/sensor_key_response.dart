class SensorKeyResponse {
  final String sensorKey;

  const SensorKeyResponse({required this.sensorKey});

  factory SensorKeyResponse.fromJson(Map<String, dynamic> json) {
    return SensorKeyResponse(
      sensorKey: (json['sensor_key'] ?? json['data']?['sensor_key'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sensor_key': sensorKey,
    };
  }
}
