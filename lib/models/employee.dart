import 'dart:convert';

import 'package:eshop_test/main.dart';
import 'package:eshop_test/models/task.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

class Employee {
  final int idEmployee;
  final String usernameUser;
  final String passwordUser;
  final String firstnameUser;
  final String lastnameUser;
  final String emailUser;
  final bool enabled;
  final bool locked;
  final String userRole;
  final String team;
  final Task task;

  Employee({
    @required this.idEmployee,
    @required this.usernameUser,
    @required this.passwordUser,
    @required this.firstnameUser,
    @required this.lastnameUser,
    @required this.emailUser,
    @required this.enabled,
    @required this.locked,
    @required this.userRole,
    @required this.team,
    @required this.task,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      idEmployee: json['idUser'] as int,
      usernameUser: json['usernameUser'] as String,
      passwordUser: json['passwordUser'] as String,
      firstnameUser: json['firstnameUser'] as String,
      lastnameUser: json['lastnameUser'] as String,
      emailUser: json['emailUser'] as String,
      team: json['team'] as String,
    );
  }

  var employeesURL = Uri.parse("$baseURL/home/employee/retrieve-all");
  var employeeByUsernameURL = Uri.parse("$baseURL/home/employee/$loggedUser");

  Future<List<Employee>> getEmployees() async {
    Response res = await get(employeesURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Employee> employees = body
          .map(
            (dynamic item) => Employee.fromJson(item),
          )
          .toList();

      return employees;
    } else {
      throw "Unable to retrieve employees.";
    }
  }

  Future<Employee> getEmployeeByUsername() async {
    Response res = await get(employeeByUsernameURL);

    if (res.statusCode == 200) {
      Employee employee = Employee.fromJson(jsonDecode(res.body));
      // List<String>
      print(res.body);
      print(employee);
      print(employee.usernameUser);
      return employee;
    } else {
      throw "Unable to retrieve employees.";
    }
  }
}

// final String employeesURL = "https://jsonplaceholder.typicode.com/posts";
