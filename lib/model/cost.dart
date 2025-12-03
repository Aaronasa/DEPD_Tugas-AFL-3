part of 'model.dart';

class Cost extends Equatable {
  final String? name;
  final String? code;
  final String? service;
  final String? description;
  final int? cost;
  final String? etd;

  const Cost({
    this.name,
    this.code,
    this.service,
    this.description,
    this.cost,
    this.etd,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
    name: json['name'] as String?,
    code: json['code'] as String?,
    service: json['service'] as String?,
    description: json['description'] as String?,
    cost: json['cost'] as int?,
    etd: json['etd'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'service': service,
    'description': description,
    'cost': cost,
    'etd': etd,
  };

  @override
  List<Object?> get props {
    return [name, code, service, description, cost, etd];
  }
}
