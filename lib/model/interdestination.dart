part of 'model.dart';

class Interdestination extends Equatable {
  final String? countryId;
  final String? countryName;

  const Interdestination({this.countryId, this.countryName});

  factory Interdestination.fromJson(Map<String, dynamic> json) {
    return Interdestination(
      countryId: json['country_id'] as String?,
      countryName: json['country_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'country_id': countryId,
    'country_name': countryName,
  };

  @override
  List<Object?> get props => [countryId, countryName];
}
