class HomeDashboardModel {
  final String? welcomeMessage;
  final int totalAreas;
  final int totalSensors;
  final int totalAnomaliesToday;
  final Map<String, dynamic>? extraData;

  const HomeDashboardModel({
    this.welcomeMessage,
    this.totalAreas = 0,
    this.totalSensors = 0,
    this.totalAnomaliesToday = 0,
    this.extraData,
  });

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    return HomeDashboardModel(
      welcomeMessage: json['welcome_message'] as String?,
      totalAreas: json['total_areas'] as int? ?? 0,
      totalSensors: json['total_sensors'] as int? ?? 0,
      totalAnomaliesToday: json['total_anomalies_today'] as int? ?? 0,
      extraData: json['extra_data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (welcomeMessage != null) 'welcome_message': welcomeMessage,
      'total_areas': totalAreas,
      'total_sensors': totalSensors,
      'total_anomalies_today': totalAnomaliesToday,
      if (extraData != null) 'extra_data': extraData,
    };
  }
}
