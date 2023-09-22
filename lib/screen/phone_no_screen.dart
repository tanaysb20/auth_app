import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'otp_screen.dart';

class PhoneNoScreen extends StatefulWidget {
  const PhoneNoScreen({super.key});

  @override
  State<PhoneNoScreen> createState() => _PhoneNoScreenState();
}

class _PhoneNoScreenState extends State<PhoneNoScreen> {
  final TextEditingController controller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: "USA");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 40.h),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Andika",
                  fontWeight: FontWeight.w900,
                  fontSize: 24.sp),
            ),
          ),
          Image.asset(
            "assets/number.jpg",
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: InternationalPhoneNumberInput(
              // maxLength: 10,
              onFieldSubmitted: (value) {
                print(value);
              },
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              textStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: "Andika",
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: true,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: SizedBox(
              width: 200.w,
              height: 40.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3E8B3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return OtpScreen();
                      },
                    ));
                  },
                  child: Text(
                    "Send OTP",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Andika",
                        fontWeight: FontWeight.w400,
                        fontSize: 19.sp),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
