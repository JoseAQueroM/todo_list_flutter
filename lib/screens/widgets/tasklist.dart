import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'tastile_info.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>( 
      builder: (context, taskData, child){

        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index){
              final task = taskData.tasks[index];
              return TaskTileInfo(
                taskTile: task.name, 
                isChecked: task.isDone, 
                checkboxCallback: (checkboxState){
                  taskData.toggleTask(task);
                },
                deleteCallback: () {
                  taskData.deleteTask(task);
                },
              );
          },
        );

      }
    );  
  }
}
