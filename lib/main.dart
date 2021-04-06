import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/InitialPage.dart';
import 'package:todo_list/pages/FormPage.dart';
import 'package:todo_list/provider/tasks.provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
         create: (context) => TasksProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'TodoApp',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => InitialPage(),
          '/nova-tarefa': (context) => TaskForm(),
        },
      ),
    );
  }
}
