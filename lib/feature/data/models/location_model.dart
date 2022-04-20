import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'dimension': dimension,
        'residents': residents,
        'url': url,
        'created': created.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        dimension,
        residents,
        url,
        created,
      ];
}
