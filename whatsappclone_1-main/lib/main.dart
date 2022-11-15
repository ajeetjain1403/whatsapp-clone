import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/Responsive/responsive_layout.dart';
import 'package:whatsappclone/colors.dart';
import 'package:whatsappclone/common/error.dart';
import 'package:whatsappclone/common/widgets/loader.dart';
import 'package:whatsappclone/features/landing/screens/landing_screen.dart';
import 'package:whatsappclone/firebase_options.dart';
import 'package:whatsappclone/router.dart';
import 'package:whatsappclone/screens/mobile_screenlayout.dart';
import 'package:whatsappclone/screens/web_screenlayout.dart';

import 'features/auth/controller/auth_controller.dart';

// import 'dart:js';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      onGenerateRoute: (Settings) => generateRoute(Settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MoblieScreenLayout();
            },
            error: (err, trace) {
              return ErorrScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }
}
