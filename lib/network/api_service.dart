import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/companies.dart';

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Stream<CompaniesModel> fetchCompanies() async* {
    print("Fetching API:: $apiUrl");
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print("Fetching API SUccess");
      yield CompaniesModel.fromJson(jsonDecode(response.body));
    } else {
      print("Fetching Fail");
      throw Exception('Failed to load companies');
    }
  }
}
