import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/task_data.dart';
import 'package:to_do/widgets/tasks_list.dart';

import '../Task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[700],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.amberAccent[700],
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('To do',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    )),
                Text(
                  '${Provider.of<TaskData>(context).taskList.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent[700],
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen());

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
