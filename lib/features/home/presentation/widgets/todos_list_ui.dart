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
          Text(
            'Tasks List',
            style: textStyleF120W700(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 120,
                        width: double.infinity,
                        color: greyColor.shade200,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Task title: ",
                                  style: textStyleF15W700(),
                                ),
                                Expanded(
                                  child: Text(
                                    todos[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Task status: ",
                                  style: textStyleF15W700(),
                                ),
                                Checkbox(
                                  value: todos[index].completed,
                                  onChanged: null,
                                ),
                                Text(
                                  todos[index].completed == false
                                      ? "Incompleted"
                                      : "Completed",
                                  style: textStyleF15W700(),
                                ),
                              ],
                            ),
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
