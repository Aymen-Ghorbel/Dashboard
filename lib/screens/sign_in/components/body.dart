import 'dart:convert';

import 'package:eshop_test/components/default_button.dart';
import 'package:eshop_test/main.dart';
import 'package:eshop_test/models/userAttempt.dart';
import 'package:eshop_test/screens/employee/employee_screen.dart';
// import 'package:eshop_test/screens/splash/components/sign_form.dart';
import 'package:eshop_test/screens/admin/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:eshop_test/size_config.dart';
import 'package:eshop_test/components/custom_suffix_icon.dart';
import 'package:eshop_test/constants.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

String loggedUser;

User userAttempt = new User("", "");

Map<String, String> headers = {"Content-Type": "application/json"};

Future<String> loginFunction(String username, String password) async {
  print('Sign in is working');
  var url = Uri.parse("$baseURL/home/authenticate");
  print('$url');
  var resp = await http.post(url,
      headers: headers,
      body: json.encode({"username": username, "password": password}));
  print('$resp.body');
  if (resp.statusCode == 200)
    return resp.body;
  else
    return '${resp.statusCode}';
}

Future<int> unSeenTasksCount() async {
  var url =
      Uri.parse("$baseURL/home/UnSeenEmployeeTasksCount-userName/$loggedUser");
  print('$url');
  var resp = await http.get(url);
  print(resp.body);
  var count = int.parse(resp.body);
  if (resp.statusCode == 200)
    return count;
  else
    return 0;
}

String test() {
  return _SignFormState().emailValue;
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  String emailValue;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 40,
                  color: aPrimaryColor,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // SignForm(),
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(),

              // SizedBox(
              //   height: 100,
              // ),
              Spacer(
                flex: 1,
              ),

              DefaultButton(
                  text: "Continue",
                  press: () async {
                    // loggedUser = emailController.text;
                    loggedUser = "fedi123";
                    // var jwt = await loginFunction(
                    //     emailController.text, passwordController.text);
                    var jwt = await loginFunction("admin", "admin");
                    // var jwt = await loginFunction("fedi123", "employee");
                    unSeenCount = await unSeenTasksCount();
                    List listJwt = jwt.split(",");
                    // List authorityList = listJwt[1];
                    // String authorityString = authorityList.join();
                    print(listJwt[1]);
                    // print(authorityString);
                    // print(listJwt[1] ==
                    //     '"authorities":[{"authority":"ROLE_ADMIN"}]');
                    if (listJwt[1] ==
                        '"authorities":[{"authority":"ROLE_ADMIN"}]')
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminScreen()));

                    if (listJwt[1] ==
                        '"authorities":[{"authority":"ROLE_EMPLOYEE"}]')
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeScreen()));
                    print("now the current user is $loggedUser");
                    // const TestScreen(name: 'login')));
                  }),

              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        emailValue = value;
        if (value.isNotEmpty) {
          removeError(error: aEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: aInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: aEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: aInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your username",
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
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: aPassNullError);
        } else if (value.length >= 8) {
          removeError(error: aShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: aPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: aShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
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
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  String emailValue;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: aPassNullError);
        } else if (value.length >= 8) {
          removeError(error: aShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: aPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: aShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
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
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        emailValue = value;
        if (value.isNotEmpty) {
          removeError(error: aEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: aInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: aEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: aInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
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
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
