import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _PhoneNoScreenState();
}

class _PhoneNoScreenState extends State<OtpScreen> {
  final TextEditingController controller = TextEditingController();

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
              "Otp Screen",
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
            width: double.infinity,
            child: OtpTextField(
              fillColor: Colors.green,
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Your details has been submitted.'),
                      );
                    });
              }, // end onSubmit
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
                    EasyLoading.showToast("Your details has been submitted.",
                        maskType: EasyLoadingMaskType.black);
                  },
                  child: Text(
                    "Submit",
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
