// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/common/error.dart';
import 'package:whatsappclone/features/auth/screens/login_screen.dart';
import 'package:whatsappclone/features/auth/screens/otp_screen.dart';
import 'package:whatsappclone/features/auth/screens/user-information-screen.dart';
import 'package:whatsappclone/features/select%20contacts/screens/select_conatct_screens.dart';
import 'package:whatsappclone/features/chats/screens/mobile_chat_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));
    case UserInformationScreen.routename:
      return MaterialPageRoute(
          builder: (context) => const UserInformationScreen());
    case SelectContactScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContactScreen());
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(
          builder: (context) => MobileChatScreen(
                name: name,
                uid: uid,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErorrScreen(error: 'This Page does\'nt exist '),
              ));
  }
}
