import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/provider/tasks.provider.dart';


class TaskTile extends StatelessWidget {

  final Task task;

  const TaskTile(this.task);

  @override
  Widget build(BuildContext context) {

    final text = task.text;

    return ListTile(
      subtitle: Text('Quantidade ${task.amount}'),
      title: Text(text),
      trailing: Container(
        width: 96,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('/nova-tarefa', 
                arguments: task,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.redAccent,
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text("Excluir item"),
                    content: Text("Deseja realmente exlcuir este item da lista?"),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Não')
                      ),
                      FlatButton(
                        onPressed: () {
                          Provider.of<TasksProvider>(context, listen: false).remove(task);
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Sim')
                      ),
                    ],
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}