import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier{
  List<Task> taskList=[
    Task(name: '1')
  ];

  void addTask(String name){
    taskList.add(Task(name: name));
    notifyListeners();
  }

  void removeTask(int index){
    taskList.removeAt(index);
    notifyListeners();
  }

  void checkTask(int index){
    taskList[index].toggleDone();
    notifyListeners();
  }
}