import 'package:flutter/material.dart';

bool isChecked = false;

class TaskTileInfo extends StatelessWidget {
  final String taskTile;
  final bool isChecked;
  final ValueChanged checkboxCallback;
  final VoidCallback deleteCallback;

  TaskTileInfo({
    required this.taskTile,
    required this.isChecked,
    required this.checkboxCallback,
    required this.deleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  '¿Estás seguro de que deseas eliminar esta tarea?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                        onPressed: () {
                          deleteCallback();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Eliminar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12),
                        )),
                  )
                ],
              );
            });
      },
      child: ListTile(
        title: Text(
          taskTile,
          style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlue,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
