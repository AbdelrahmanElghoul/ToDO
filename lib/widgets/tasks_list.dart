import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_data.dart';
import 'package:to_do/widgets/tasks_tile.dart';

import '../Task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress:() =>  Provider.of<TaskData>(context,listen: false).removeTask(index),
          child: TaskTile(
            taskTitle: Provider.of<TaskData>(context).taskList[index].name,
            isChecked: Provider.of<TaskData>(context).taskList[index].isChecked,
            checkBoxCallBack: (checkBoxState) => {
              setState(() {
                Provider.of<TaskData>(context,listen: false).checkTask(index);
              }),
            },
          ),
        );
      },
      itemCount: Provider.of<TaskData>(context).taskList.length,
    );
  }
}
