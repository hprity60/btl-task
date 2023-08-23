// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../../domain/repositories/get_todos_repository.dart';
import '../datasources/remote_data_sources.dart/get_todos_remote_data_source.dart';
import '../models/todos_response_model.dart';

class GetTodosRepositoryImpl implements GetTodosRepository {
  final GetTodosRemoteDataSource getTodosRemoteDataSource;
  GetTodosRepositoryImpl({
    required this.getTodosRemoteDataSource,
  });

  @override
  Future<List<TodosResponseModel>> getTodos() async {
    try {
      final List<TodosResponseModel> todosResponseModel =
          await getTodosRemoteDataSource.getTodos();

      return todosResponseModel;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
