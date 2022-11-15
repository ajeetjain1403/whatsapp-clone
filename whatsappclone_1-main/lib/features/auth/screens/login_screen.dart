// import 'dart:ffi';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/colors.dart';
import 'package:whatsappclone/common/utils/utils.dart';
import 'package:whatsappclone/common/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneContoller = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneContoller.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneContoller.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'fill all details');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("ENTER YOUR PHONE NUMBER"),
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text('Whatsapp needs to verify your number'),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: pickCountry, child: const Text('Pick Country')),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    if (country != null)
                      Text(
                        '+${country!.phoneCode}',
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneContoller,
                        decoration: InputDecoration(
                          hintText: 'phone number',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.6,
                ),
                SizedBox(
                  width: 90,
                  child: CustomButton(text: "NEXT", onpressed: sendPhoneNumber),
                ),
              ],
            ),
          ),
        ));
  }
}
