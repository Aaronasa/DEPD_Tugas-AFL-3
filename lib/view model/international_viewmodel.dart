import 'package:flutter/material.dart';
import 'package:depd_mvvm_25/model/model.dart';
import 'package:depd_mvvm_25/data/response/api_response.dart';
import 'package:depd_mvvm_25/repository/international_repository.dart';

class InternationalViewModel with ChangeNotifier {
  final _repo = InternationalRepository();

  // --- COUNTRY LIST (International Destination) ---
  ApiResponse<List<Interdestination>> countryList = ApiResponse.notStarted();

  setCountryList(ApiResponse<List<Interdestination>> response) {
    countryList = response;
    notifyListeners();
  }

  Future getCountryList({String query = ""}) async {
    setCountryList(ApiResponse.loading());

    _repo
        .searchInternationalDestination(query)
        .then((value) {
          setCountryList(ApiResponse.completed(value));
        })
        .onError((error, _) {
          setCountryList(ApiResponse.error(error.toString()));
        });
  }

  ApiResponse<List<Intercost>> interCostList = ApiResponse.notStarted();

  setInterCostList(ApiResponse<List<Intercost>> response) {
    interCostList = response;
    notifyListeners();
  }

  bool isLoading = false;
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Hitung international cost
  Future checkInternationalCost({
    required String origin,
    required String destinationCountryId,
    required int weight,
    required String courier,
  }) async {
    setLoading(true);
    setInterCostList(ApiResponse.loading());

    _repo
        .calculateInternationalCost(
          origin: origin,
          destination: destinationCountryId,
          weight: weight,
          courier: courier,
        )
        .then((value) {
          setInterCostList(ApiResponse.completed(value));
          setLoading(false);
        })
        .onError((error, _) {
          setInterCostList(ApiResponse.error(error.toString()));
          setLoading(false);
        });
  }
}