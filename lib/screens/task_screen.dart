import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:todoapp/screens/add_task.dart';
import 'package:todoapp/widgets/task_lists.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (dialogContex) => AddTask(globalContext: context));
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "To-do App",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "Para acceder a más opciones desliza cada actividad hacia la izquierda",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                autofocus: false,
                autocorrect: false,
                onChanged: (value) {
                  Provider.of<TaskData>(context, listen: false)
                      .filterTasks(value);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Buscar actividad",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: TaskLists(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
