import 'package:flutter/material.dart';
import 'package:eshop_test/size_config.dart';

const aPrimaryColor = Color(0xFFFC052E);
const aPrimaryLightColor = Color(0xFFFFECDF);
const aPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const aSecondaryColor = Color(0xFF96CB44);
const aSecondaryLightColor = Color(0xFFE8F8CF);
const aTextColor = Color(0xFF757575);

const aAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String aEmailNullError = "Please Enter your email";
const String aInvalidEmailError = "Please Enter Valid Email";
const String aPassNullError = "Please Enter your password";
const String aShortPassError = "Password is too short";
const String aMatchPassError = "Passwords don't match";
const String aNameNullError = "Please Enter your name";
const String aPhoneNumberNullError = "Please Enter your phone number";
const String aAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: aTextColor),
  );
}
