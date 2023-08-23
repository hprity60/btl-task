part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class TodosListSuccessState extends HomeState {
  final List<TodosResponseModel> todosResponseModel;

  const TodosListSuccessState({required this.todosResponseModel});

  @override
  List<Object> get props => [TodosResponseModel];
}

class TodosLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class TodosFailureState extends HomeState {
  final String errorMessage;

  const TodosFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
