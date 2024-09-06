import 'package:flutter/material.dart';
import 'package:httpsrequestxirpl3part2/models/ToDo.dart';
import 'package:httpsrequestxirpl3part2/service/http_service.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  int todoCount = 0;
  List? Todos;
  String result = "";
  HttpService? service = HttpService();

  @override
  void initState() {
    service = HttpService();
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    Todos = [];
    Todos = await service!.getToDo() as List<ToDo>;
    print(Todos);
    setState(() {
      todoCount = Todos!.length;
      Todos = Todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    service?.getToDo().then((value) => {
          setState(() {
            result = value as String;
          })
        });
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: (this.todoCount == null )? 0 : this.todoCount ,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(Todos![position].id.toString()),
              subtitle: Text('Pro: ${Todos![position].title}'),
            ),
          );
        },
      ),
    );
  }
}
