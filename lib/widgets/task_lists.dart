import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/screens/edit_task.dart';
import 'package:todoapp/widgets/list_tile.dart';

class TaskLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.filteredTasks[index];
          return ListTileWidget(
            taskTitle: task.title,
            isChecked: task.isDone,
            checkedCallback: (isCheckedValue) {
              taskData.updateTask(task);
            },
            deleteFunction: () {
              taskData.deleteTask(task);
            },
            editFunction: () {
              showModalBottomSheet(
                context: context,
                builder: (dialogContex) => EditTask(
                  task: task,
                ),
              );
            },
          );
        },
        itemCount: taskData.filteredTasks.length,
      );
    });
  }
}
