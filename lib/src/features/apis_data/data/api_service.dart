import 'dart:convert';

import 'package:hiringtask/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, dynamic>>> fetchApiData() async {
    final response = await http.get(Uri.parse('${AppConstants.apiUrl}/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
