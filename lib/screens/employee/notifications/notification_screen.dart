import 'package:eshop_test/components/coustom_bottom_nav_bar.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/enums.dart';
import 'package:eshop_test/main.dart';
import 'package:eshop_test/screens/profile/profile_screen.dart';
import 'package:eshop_test/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

import 'package:eshop_test/models/task.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import 'components/unSeenTask_card.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = '/employee/notification';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              "You have $unSeenCount new task(s)",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            FutureBuilder(
              future: task.getUnSeenTasks(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                if (snapshot.hasData) {
                  List<Task> unSeenTasks = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...List.generate(
                            unSeenTasks.length,
                            (index) {
                              return UnSeenTaskCard(task: unSeenTasks[index]);

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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.notifications,
        counter: unSeenCount,
      ),
    );
  }
}
