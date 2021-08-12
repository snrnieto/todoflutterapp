import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/models/tasks.dart';

class EditTask extends StatelessWidget {
  final Tasks task;
  const EditTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController();
    txt.text = task.title;
    String newTask = "";

    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      color: Color(0xff7C7C7C),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Editar actividad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txt,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
                onChanged: (newValue) {
                  newTask = newValue;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: queryData.size.width * 0.8,
                  height: queryData.size.height * 0.07,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[400],
                  ),
                  onPressed: () {
                    print("Guardar");
                    Provider.of<TaskData>(context, listen: false)
                        .editTask(task, newTask);
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: queryData.size.width * 0.8,
                  height: queryData.size.height * 0.07,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
