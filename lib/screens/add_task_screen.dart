import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Task.dart';
import '../task_data.dart';

class AddTaskScreen extends StatelessWidget {

  String typedText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.amberAccent[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) => typedText=value,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              color: Colors.amberAccent[700],
              onPressed: () {
                Provider.of<TaskData>(context,listen:false).addTask(typedText);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
