
import '../../models/todos_response_model.dart';

abstract class GetTodosRemoteDataSource {
  Future<List<TodosResponseModel>> getTodos();
}
