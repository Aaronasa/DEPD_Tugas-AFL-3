import 'package:depd_mvvm_25/data/network/network_api_service.dart';
import 'package:depd_mvvm_25/model/model.dart';

class InternationalRepository {
  final _apiServices = NetworkApiService();

  Future<List<Interdestination>> searchInternationalDestination(
      String keyword) async {

    final response = await _apiServices.getGetApiResponse(
      'destination/international-destination?search=$keyword&limit=99&offset=0',
    );

    final meta = response['meta'];
    if (meta == null || meta['status'] != 'success') {
      throw Exception("API Error: ${meta?['message'] ?? 'Unknown error'}");
    }

    final data = response['data'];
    if (data is! List) return [];

    return data.map((e) => Interdestination.fromJson(e)).toList();
  }

  Future<List<Intercost>> calculateInternationalCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) async {

    final body = {
      "origin": origin,
      "destination": destination,
      "weight": weight.toString(),
      "courier": courier,
    };

    final response = await _apiServices.postApiResponse(
      'calculate/international-cost',
      body,
    );

    final meta = response['meta'];
    if (meta == null || meta['status'] != 'success') {
      throw Exception("API Error: ${meta?['message'] ?? 'Unknown error'}");
    }

    final data = response['data'];
    if (data is! List) return [];

    return data.map((e) => Intercost.fromJson(e)).toList();
  }
}
