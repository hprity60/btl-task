import 'package:btl_task/core/values/app_colors.dart';
import 'package:btl_task/core/values/text_styles.dart';
import 'package:flutter/material.dart';

import '../../data/models/todos_response_model.dart';

class TodosListUI extends StatelessWidget {
  TodosListUI({
    super.key,
    required this.todos,
  });

  final List<TodosResponseModel> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text('Tasks List'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        color: primaryColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Task title: ",
                                  style: textStyleF15W700(),
                                ),
                                Text(todos[1].title),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    )));
  }
}
