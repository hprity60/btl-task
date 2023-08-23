
import '../../data/models/todos_response_model.dart';

abstract class GetTodosRepository {
  Future<List<TodosResponseModel>> getTodos();
}
