import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/remote_data_sources.dart/get_todos_remote_data_source_impl.dart';
import '../../data/models/todos_response_model.dart';
import '../../data/repositories/get_todos_repository_impl.dart';
import '../bloc/home_bloc.dart';
import '../widgets/todos_list_ui.dart';

class HomePage extends StatelessWidget {
  static const id = "home_page";

  HomePage({super.key});

  late List<TodosResponseModel> list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getTodosRepository: GetTodosRepositoryImpl(
              getTodosRemoteDataSource:
                  GetTodosRemoteDataSourceImpl(dio: DioProvider())))
        ..add(GetTodosEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // if (state is RecipesListSuccessState) {
            //   list = state.recipesResponseModel.hits;
            // } else if (state is SearchRecipeLoadedState) {
            //   list = state.recipeData;
            // }
          },
          builder: (context, state) {
            print("Current state >> $state");

            if (state is TodosLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TodosListSuccessState) {
              // return const Text('Search Anything you want to see');
              return TodosListUI(
                todos: state.todosResponseModel,
              );
            }
            return Center(
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
