import 'package:glosseum_frontend/core/providers/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statusProvider = FutureProvider<String>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/');
  return response.data.toString();
});
