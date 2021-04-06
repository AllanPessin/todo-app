import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/task.repository.dart';


class TasksProvider with ChangeNotifier {
  final Map<String, Task> _items = {...TasksRepository};

  List<Task> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Task byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Task task) {
    if(task == null) {
      return;
    }
    //update
    if(task.id != null && task.id.trim().isNotEmpty && _items.containsKey(task.id)) {
      _items.update(task.id, (_) => task);
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Task(
        id: id,
        text: task.text,
        amount: task.amount,
      ),);
    }    
    notifyListeners();
  }

  void remove(Task task) {
    if(task != null && task.id != null) {
      _items.remove(task.id);
      notifyListeners();
    }
  }
}