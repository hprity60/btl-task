// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/todos_response_model.dart';
import '../../data/models/todos_response_model.dart';
import '../../domain/repositories/get_todos_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodosRepository getTodosRepository;
  late List<TodosResponseModel> todosData;
  HomeBloc({required this.getTodosRepository}) : super(HomeInitial()) {
    on<GetTodosEvent>((event, emit) async {
      emit(TodosLoadingState());

      try {
        todosData =
            await getTodosRepository.getTodos();
        emit(TodosListSuccessState(todosResponseModel: todosData));
      } on DioException {
        rethrow;
      } catch (e) {
        emit(TodosFailureState(errorMessage: e.toString()));
        rethrow;
      }
    });
  }
}
