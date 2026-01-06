import 'dart:convert'; // WAJIB: Tambahkan ini di paling atas file
import '../use_case/response/get_category_response.dart';
import '../service/http_service.dart';

class CategoryRepository {
  final HttpService httpService;

  CategoryRepository(this.httpService);

  Future<GetCategoryResponse> getAllCategory() async {
    final response = await httpService.get('categories', {});
    if (response.statusCode == 200) {
      final responseData = GetCategoryResponse.fromJson(jsonDecode(response.body));
      return responseData;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}