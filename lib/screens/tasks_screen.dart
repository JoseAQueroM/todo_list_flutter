import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/screens/addtask_screen.dart';
import './widgets/tasklist.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    double availableHeight = MediaQuery.of(context).size.height
    -kToolbarHeight 
    - MediaQuery.of(context).padding.top 
    - MediaQuery.of(context).padding.bottom
    - 120;

    return Scaffold(
      floatingActionButton: Container(
        height: 45,
        width: 45,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (context) => AddtaskScreen());
          },
          child: Icon(
            Icons.add,
            size: 32,
            color: Colors.lightBlue,
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlue,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 8, left: 8, right: 8),
                child: Container(
                  height: availableHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 40, bottom: 10),
                      child: TasksList()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  child: Text(
                    '${Provider.of<TaskData>(context).tasks.length} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
