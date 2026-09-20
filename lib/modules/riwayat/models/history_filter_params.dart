class HistoryFilterParams {
  final int? sensorId;
  final String? parameter;
  final String? status;
  final String? date;
  final int limit;
  final int index;

  const HistoryFilterParams({
    this.sensorId,
    this.parameter,
    this.status,
    this.date,
    this.limit = 10,
    this.index = 0,
  });

  HistoryFilterParams copyWith({
    int? sensorId,
    String? parameter,
    String? status,
    String? date,
    int? limit,
    int? index,
  }) {
    return HistoryFilterParams(
      sensorId: sensorId ?? this.sensorId,
      parameter: parameter ?? this.parameter,
      status: status ?? this.status,
      date: date ?? this.date,
      limit: limit ?? this.limit,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (sensorId != null) 'sensor_id': sensorId,
      if (parameter != null && parameter!.isNotEmpty) 'parameter': parameter,
      if (status != null && status!.isNotEmpty) 'status': status,
      if (date != null && date!.isNotEmpty) 'date': date,
      'limit': limit,
      'index': index,
    };
  }
}
