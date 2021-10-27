import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/enums.dart';
import 'package:eshop_test/screens/profile/profile_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/task.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';
import '../../size_config.dart';
import 'components/task_card.dart';

class EmployeeScreen extends StatefulWidget {
  static String routeName = '/employee';

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final Task task = Task();

  Future<List<Task>> listTasks;

  @override
  void initState() {
    super.initState();
    listTasks = task.getTasks();
  }

  Future<Null> _refresh() {
    setState(() {
      listTasks = task.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Tasks"),
            Spacer(),
            Text("$loggedUser"),
            IconButton(
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: Colors.white),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
        backgroundColor: aPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: task.getTasks(),
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.hasData) {
              List<Task> tasks = snapshot.data;

              print('you have $unSeenCount unseen task(s)');
              return RefreshIndicator(
                onRefresh: _refresh,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...List.generate(
                        tasks.length,
                        (index) {
                          return TaskCard(task: tasks[index]);

                          return SizedBox
                              .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                ),
              );
              // return ListView(
              //   children: tasks
              //       .map(
              //         (Task task) => Card(
              //           child: ListTile(
              //             title: Text(task.title),
              //             subtitle: Text("${task.description}"),
              //             tileColor: Color(0xFFF5F6F9),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // );
            } else {
              return Text('No Data sorry :(');
              // return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.tasks,
        counter: unSeenCount,
      ),
    );
  }
}
