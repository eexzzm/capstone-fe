class AreaModel {
  final int id;
  final String name;
  final String? description;
  final String? location;
  final int sensorsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AreaModel({
    required this.id,
    required this.name,
    this.description,
    this.location,
    this.sensorsCount = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      location: json['location'] as String?,
      sensorsCount: json['sensors_count'] as int? ?? 0,
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
      'name': name,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      'sensors_count': sensorsCount,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  AreaModel copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    int? sensorsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AreaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      sensorsCount: sensorsCount ?? this.sensorsCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
