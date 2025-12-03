part of 'model.dart';

class Intercost extends Equatable {
  final String? name;
  final String? code;
  final String? service;
  final String? description;
  final String? currency;
  final int? cost;
  final String? etd;
  final String? currencyUpdatedAt;
  final int? currencyValue;

  const Intercost({
    this.name,
    this.code,
    this.service,
    this.description,
    this.currency,
    this.cost,
    this.etd,
    this.currencyUpdatedAt,
    this.currencyValue,
  });

  factory Intercost.fromJson(Map<String, dynamic> json) => Intercost(
    name: json['name'] as String?,
    code: json['code'] as String?,
    service: json['service'] as String?,
    description: json['description'] as String?,
    currency: json['currency'] as String?,
    cost: json['cost'] as int?,
    etd: json['etd'] as String?,
    currencyUpdatedAt: json['currency_updated_at'] as String?,
    currencyValue: json['currency_value'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'service': service,
    'description': description,
    'currency': currency,
    'cost': cost,
    'etd': etd,
    'currency_updated_at': currencyUpdatedAt,
    'currency_value': currencyValue,
  };

  @override
  List<Object?> get props {
    return [
      name,
      code,
      service,
      description,
      currency,
      cost,
      etd,
      currencyUpdatedAt,
      currencyValue,
    ];
  }
}
