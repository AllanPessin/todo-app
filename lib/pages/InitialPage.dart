import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/tasks.provider.dart';
import 'package:todo_list/widgets/task.tile.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final TasksProvider tasks = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: tasks.count,
        itemBuilder: (context, index) => TaskTile(tasks.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/nova-tarefa');
        },
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add),
      ),
    );
  }
}