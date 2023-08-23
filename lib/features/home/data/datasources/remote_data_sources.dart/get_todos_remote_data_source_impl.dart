import 'package:dio/dio.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/values/app_strings.dart';
import '../../models/todos_response_model.dart';
import 'get_todos_remote_data_source.dart';

class GetTodosRemoteDataSourceImpl implements GetTodosRemoteDataSource {
  DioProvider dio;
  GetTodosRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<TodosResponseModel>> getTodos() async {
    try {
      Response response = await dio.client.get(
        AppStrings.todosUrl,
      );
      final List<dynamic> responseBody = response.data; // This should be a List
      final List<TodosResponseModel> todosResponseModel =
          List<TodosResponseModel>.from(
        responseBody.map((dynamic item) => TodosResponseModel.fromJson(item)),
      );
      return todosResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
