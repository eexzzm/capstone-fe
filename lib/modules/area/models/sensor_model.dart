class SensorModel {
  final int id;
  final int areaId;
  final int ownerId;
  final String name;
  final String code;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SensorModel({
    required this.id,
    required this.areaId,
    required this.ownerId,
    required this.name,
    required this.code,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory SensorModel.fromJson(Map<String, dynamic> json) {
    return SensorModel(
      id: json['id'] as int? ?? 0,
      areaId: json['area_id'] as int? ?? 0,
      ownerId: json['owner_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      description: json['description'] as String?,
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
      'area_id': areaId,
      'owner_id': ownerId,
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  SensorModel copyWith({
    int? id,
    int? areaId,
    int? ownerId,
    String? name,
    String? code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SensorModel(
      id: id ?? this.id,
      areaId: areaId ?? this.areaId,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
