import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {

  List<Task> tasks = [
    Task(name: 'Limpiar el cuarto'),
  ];

  TaskData(){
    loadTasks();
  }

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks'); 
    if (taskList != null) {
      tasks = taskList.map((task) => Task.fromMap(jsonDecode(task))).toList(); 
      
    } else {
      tasks = [];
    }

    notifyListeners();
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList = tasks.map((task) => jsonEncode(task.toMap())).toList();
    prefs.setStringList('tasks', taskList);
  }

  void addTask(String taskname) {
    final alphanumeric = RegExp(r'[a-zA-Z]');

    if (alphanumeric.hasMatch(taskname)) {
      tasks.add(Task(name: taskname));
      saveTasks();
      notifyListeners();
    } else {
      return;
    }
  }

  void deleteTask(Task task){
    tasks.remove(task);
    saveTasks();
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    saveTasks();
    notifyListeners();
  }
}
