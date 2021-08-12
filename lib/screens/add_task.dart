import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTask extends StatelessWidget {
  final BuildContext globalContext;
  const AddTask({Key? key, required this.globalContext}) : super(key: key);

  Future getRandomTask() async {
    final url = Uri.parse('https://catfact.ninja/fact?max_length=100');

    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      print(data);

      Provider.of<TaskData>(globalContext, listen: false)
          .addTasks("${data['fact']}");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                'Nueva actividad',
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
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Escribe una actividad",
                ),
                onChanged: (newValue) {
                  newTask = newValue;
                },
              ),
              Spacer(),
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
                    Provider.of<TaskData>(context, listen: false)
                        .addTasks(newTask);
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    'Añadir',
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
                    primary: Colors.blue[800],
                  ),
                  onPressed: () {
                    getRandomTask();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(
                    'Añadir aleatoriamente',
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
