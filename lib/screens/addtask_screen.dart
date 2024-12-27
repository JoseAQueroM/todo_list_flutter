import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class AddtaskScreen extends StatefulWidget {
  const AddtaskScreen({super.key});

  @override
  State<AddtaskScreen> createState() => _AddtaskScreenState();
}

class _AddtaskScreenState extends State<AddtaskScreen> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Text(
                'Escribe una tarea',
                style: TextStyle(fontSize: 30, color: Colors.lightBlue),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue))),
                  style: TextStyle(color: Colors.lightBlue),
                  autofocus: true,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                  onPressed: () async {
                 
                    await Future.delayed(Duration(seconds: 1));
                   
                    Provider.of<TaskData>(context, listen: false).addTask(_controller.text);
                    _controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Agregar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ],
                ),
        ),
    );
  }
}