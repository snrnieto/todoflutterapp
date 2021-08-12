import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListTileWidget extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkedCallback;
  final Function deleteFunction;
  final Function editFunction;

  ListTileWidget({
    required this.taskTitle,
    required this.isChecked,
    required this.checkedCallback,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey[50],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: ListTile(
          title: Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            checkedCallback(!isChecked);
          },
          trailing: Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              checkedCallback(newValue);
            },
          ),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.yellow[800],
          foregroundColor: Colors.white,
          icon: Icons.edit,
          onTap: () {
            editFunction();
          },
        ),
        IconSlideAction(
          caption: 'Borrar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            deleteFunction();
          },
        ),
      ],
    );
  }
}
