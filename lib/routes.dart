import 'package:eshop_test/screens/add_task/add_task_screen.dart';
import 'package:eshop_test/screens/admin/admin_employee_screen.dart';
import 'package:eshop_test/screens/admin/admin_screen.dart';
import 'package:eshop_test/screens/employee/employee_screen.dart';
import 'package:eshop_test/screens/employee/notifications/notification_screen.dart';
import 'package:eshop_test/screens/front/front_screen.dart';
import 'package:eshop_test/screens/profile/info_screen.dart';
import 'package:eshop_test/screens/profile/profile_screen.dart';
import 'package:eshop_test/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  FrontScreen.routeName: (context) => FrontScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  AdminScreen.routeName: (context) => AdminScreen(),
  AdminEmployeeScreen.routeName: (context) => AdminEmployeeScreen(),
  AddTaskScreen.routeName: (context) => AddTaskScreen(),
  EmployeeScreen.routeName: (context) => EmployeeScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  InfoScreen.routeName: (context) => InfoScreen(),
};
