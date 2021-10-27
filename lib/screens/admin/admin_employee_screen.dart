import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/enums.dart';
import 'package:eshop_test/screens/add_task/add_task_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/task.dart';

class AdminEmployeeScreen extends StatefulWidget {
  static String routeName = '/admin/employee';

  @override
  _AdminEmployeeScreenState createState() => _AdminEmployeeScreenState();
}

class _AdminEmployeeScreenState extends State<AdminEmployeeScreen> {
  final Task task = Task();

  Future<List<Task>> listTasks;
// intializing the users
  @override
  void initState() {
    super.initState();
    listTasks = task.getTasks();
  }

  Future<void> _refresh() {
    setState(() {
      listTasks = task.getTasks();
    });
    return Future.delayed(
      Duration(seconds: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text("Tasks"), Spacer(), Text("$loggedUser")],
        ),
        backgroundColor: aPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: listTasks,
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              List<Task> tasks = snapshot.data;
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView(
                  children: tasks
                      .map(
                        (Task task) => Card(
                          child: ListTile(
                            title: Text(task.title),
                            subtitle: Text("${task.description}"),
                            tileColor: Color(0xFFF5F6F9),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return Text('No Data sorry :(');
              // return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTaskScreen.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: aPrimaryColor,
      ),
    );
  }
}
