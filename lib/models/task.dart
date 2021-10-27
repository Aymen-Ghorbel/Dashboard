import 'dart:convert';

import 'package:eshop_test/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';

class Task {
  final int idTask;
  final String title;
  final String description;
  final bool seen;
  final bool done;

  Task(
      {@required this.idTask,
      @required this.title,
      @required this.description,
      this.seen,
      this.done});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      idTask: json['idTask'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      seen: json['seen'] as bool,
      done: json['done'] as bool,
    );
  }

  var tasksURL =
      Uri.parse("$baseURL/home/retrieveEmployeeTasks-userName/$loggedUser");
  var unSeenTasksURL =
      Uri.parse("$baseURL/home/retrieveUnSeenEmployeeTasks-userName/$loggedUser");

  Future<List<Task>> getTasks() async {
    Response res = await get(tasksURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Task> tasks = body
          .map(
            (dynamic item) => Task.fromJson(item),
          )
          .toList();

      return tasks;
    } else {
      throw "Unable to retrieve tasks.";
    }
  }

  Future<List<Task>> getUnSeenTasks() async {
    Response res = await get(unSeenTasksURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Task> unSeenTasks = body
          .map(
            (dynamic item) => Task.fromJson(item),
          )
          .toList();

      return unSeenTasks;
    } else {
      throw "Unable to retrieve tasks.";
    }
  }
}
