import 'package:riverpod/riverpod.dart';

import '../data/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final dataProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchApiData();
});
