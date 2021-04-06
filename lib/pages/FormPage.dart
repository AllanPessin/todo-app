import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/provider/tasks.provider.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void laodFormData(Task task) {
    if( task != null) {
      _formData['id'] = task.id;    
      _formData['text'] = task.text;    
      _formData['amount'] = task.amount;    
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Dados passados via rota
    final Task task = ModalRoute.of(context).settings.arguments;
    laodFormData(task);
  }
  
  @override
  Widget build(BuildContext context) {
       
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo item"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<TasksProvider>(context, listen: false).put(
                  Task(
                    id: _formData['id'],
                    text: _formData['text'],
                    amount: _formData['amount'],
                  ),
                );
                Navigator.of(context).pop();
              }
            }
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['text'],
                decoration: InputDecoration(labelText: 'Item'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty){
                    return 'Nome do item obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['text'] = value,
              ),
              TextFormField(
                initialValue: _formData['amount'],
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Quantidade obrigatória';
                  }
                  return null;
                },
                onSaved: (value) => _formData['amount'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
