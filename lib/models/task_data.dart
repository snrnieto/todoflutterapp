import 'package:flutter/foundation.dart';
import 'package:todoapp/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(
      title:
          "Hacer las compras en el supermercado de la esquina y gastar menos de 200.000",
    ),
    Tasks(
      title: "Ir al médico para que me revise si estoy bien",
    ),
    Tasks(
      title: "Sacar al perro hasta el parque que queda a dos cuadras",
    )
  ];

  List<Tasks> filteredTasks = [];

  List<Tasks> get tasks {
    return _tasks;
  }

  void addTasks(String newTask) {
    final task = Tasks(title: newTask);
    _tasks.add(task);
    filteredTasks = tasks;
    notifyListeners();
  }

  void editTask(Tasks task, String newTask) {
    task.title = newTask;
    filteredTasks = tasks;
    notifyListeners();
  }

  int get tasksCount {
    return _tasks.length;
  }

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks task) {
    _tasks.remove(task);
    filteredTasks = tasks;
    notifyListeners();
  }

  void filterTasks(String value) {
    filteredTasks = _tasks
        .where((tasks) =>
            tasks.title.toLowerCase().contains((value.toLowerCase())))
        .toList();

    print(filteredTasks.length);
    print(_tasks.length);

    notifyListeners();
  }
}
