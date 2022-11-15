import 'package:flutter/material.dart';
import 'package:whatsappclone/colors.dart';
import 'package:whatsappclone/common/widgets/custom_button.dart';
import 'package:whatsappclone/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Welcome To WhatsApp",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            height: Size.height / 9,
          ),
          Image.asset(
            "assets/wbg.png",
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(height: Size.height / 9),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: Size.width * 0.75,
              child: CustomButton(
                  text: "AGREE AND CONTINUE",
                  onpressed: () => navigateToLoginScreen(context)))
        ],
      )),
    );
  }
}
