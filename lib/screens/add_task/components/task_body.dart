import 'package:flutter/material.dart';
// import 'package:shop_app/components/socal_card.dart';
import 'package:eshop_test/constants.dart';

import 'package:eshop_test/size_config.dart';

import 'new_task_form.dart';

class TaskBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Add a New Task", style: headingStyle),

                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NewTaskForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                // SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
