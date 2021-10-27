import 'dart:convert';

import 'package:eshop_test/components/default_button.dart';
import 'package:eshop_test/screens/add_task/add_task_screen.dart';
import 'package:eshop_test/screens/admin/admin_employee_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class NewTaskForm extends StatefulWidget {
  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

Map<String, String> headers = {"Content-Type": "application/json"};

Future<String> addTaskFunction(String taskTitle, String taskDescription) async {
  var url = Uri.parse("$baseURL/home/addTask/$loggedUser");
  var resp = await http.post(url,
      headers: headers,
      body: json.encode({"title": taskTitle, "description": taskDescription}));
  print('$resp.body');
  if (resp.statusCode == 200)
    return 'task added successfully';
  else
    return '${resp.statusCode}';
}

class _NewTaskFormState extends State<NewTaskForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String taskTitle;
  String taskDescription;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          titleFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          descriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
              text: "Confirm",
              press: () {
                addTaskFunction(
                    titleController.text, descriptionController.text);
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => AdminEmployeeScreen()),
                //   (Route<dynamic> route) => false,
                // );

                // Navigator.pushNamed(context, AdminEmployeeScreen.routeName);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdminEmployeeScreen()),
                );
              }),
        ],
      ),
    );
  }

  TextFormField descriptionFormField() {
    return TextFormField(
      controller: descriptionController,
      minLines: 5,
      maxLines: 8,
      onSaved: (newValue) => taskDescription = newValue,
      decoration: InputDecoration(
        labelText: "Description",
        // hintText: "Enter the task Description",
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: aTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: aTextColor),
          gapPadding: 10,
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField titleFormField() {
    return TextFormField(
      controller: titleController,
      onSaved: (newValue) => taskTitle = newValue,
      decoration: InputDecoration(
        labelText: "Title",
        // hintText: "Enter the task Title",
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: aTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: aTextColor),
          gapPadding: 10,
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
