import 'package:eshop_test/screens/employee/components/task_details_screen.dart';
import 'package:eshop_test/screens/employee/notifications/components/unSeenTask_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eshop_test/models/task.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../main.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    this.width = 300,
    this.aspectRatio = 1.02,
    @required this.task,
  }) : super(key: key);

  final double width, aspectRatio;
  final Task task;

  Future<String> updateTaskSeen(int idTask) async {
    var url = Uri.parse("$baseURL/home/updateTaskSeen/$idTask");
    var resp = await http.put(url);
    print('$resp.body');
    if (resp.statusCode == 200)
      return 'task is seen';
    else
      return '${resp.statusCode}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: aPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:
              task.seen == true ? Color(0xFFF5F6F9) : Color(0xFFFFECDF),
        ),
        onPressed: () async {
          updateTaskSeen(task.idTask);
          unSeenCount = await UnSeenTaskCard(task: task).unSeenTasksCount();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TaskDetailsScreen(task)));
        },
        child: Row(
          children: [
            // SvgPicture.asset(
            //   "assets/icons/User Icon.svg",
            //   color: aPrimaryColor,
            //   width: 22,
            // ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              task.title,
              style: TextStyle(fontSize: 20),
            )),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
    // Padding(
    // // padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
    // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
    // child: SizedBox(
    //   width: getProportionateScreenWidth(width),
    //   child: GestureDetector(
    //     onTap: () {
    //       Navigator.pushNamed(context, TaskScreen.routeName);
    //       loggedUser = task.usernameUser;
    //     },
    //     // arguments: TaskDetailsArguments(task: task),
    //
    //     child: Container(
    //       padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //       decoration: BoxDecoration(
    //         // color: aSecondaryColor.withOpacity(0.1),
    //         color: Color(0xFFF5F6F9),
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //       child: Text(
    //         task.usernameUser,
    //         style: TextStyle(color: Colors.black, fontSize: 20),
    //       ),
    //     ),

    // child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     // AspectRatio(
    //     //   aspectRatio: 1.02,
    //     //   child: Container(
    //     //     padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //     //     decoration: BoxDecoration(
    //     //       color: aSecondaryColor.withOpacity(0.1),
    //     //       borderRadius: BorderRadius.circular(15),
    //     //     ),
    //     //     // child: Hero(
    //     //     //   tag: task.id.toString(),
    //     //     //   child: Image.asset(task.images[0]),
    //     //     ),
    //     //   ),
    //     // ),
    //     // const SizedBox(height: 10),
    //     Text(
    //       task.usernameUser,
    //       style: TextStyle(color: Colors.black),
    //       maxLines: 2,
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           // "\$${task.price}",
    //           "${task.price} TND", //here
    //           style: TextStyle(
    //             fontSize: getProportionateScreenWidth(18),
    //             fontWeight: FontWeight.w600,
    //             color: kPrimaryColor,
    //           ),
    //         ),
    //         InkWell(
    //           borderRadius: BorderRadius.circular(50),
    //           onTap: () {},
    //           child: Container(
    //             padding: EdgeInsets.all(getProportionateScreenWidth(8)),
    //             height: getProportionateScreenWidth(28),
    //             width: getProportionateScreenWidth(28),
    //             decoration: BoxDecoration(
    //               color: task.isFavourite
    //                   ? kPrimaryColor.withOpacity(0.15)
    //                   : kSecondaryColor.withOpacity(0.1),
    //               shape: BoxShape.circle,
    //             ),
    //             child: SvgPicture.asset(
    //               "assets/icons/Heart Icon_2.svg",
    //               color: task.isFavourite
    //                   ? Color(0xFFFF4848)
    //                   : Color(0xFFDBDEE4),
    //             ),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // ),
    //     ),
    //   ),
    // );
  }
}
