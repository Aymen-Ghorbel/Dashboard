import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eshop_test/constants.dart';
import 'package:eshop_test/screens/sign_in/sign_in_screen.dart';
import 'package:eshop_test/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// This is the best practice
// import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(image: AssetImage('assets/images/addixo.png')),
            ),
            SizedBox(
              height: 170,
            ),
            Text(
              "Welcome to your",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: aPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'dashboard',
                  textStyle: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Comfortaa',
                    color: aSecondaryColor,
                  ),
                  speed: Duration(milliseconds: 200),
                ),
              ],
            ),
            Spacer(),
            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
