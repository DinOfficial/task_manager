import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/flash_screen.dart';
import 'package:untitled/ui/screens/forgot_password_email_screen.dart';
import 'package:untitled/ui/screens/otp_verify_screen.dart';
import 'package:untitled/ui/screens/sign_up_screen.dart';

import 'log_in_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)
        ),
      ),
      initialRoute: FlashScreen().name,
      routes: <String, WidgetBuilder>{
        FlashScreen().name: (_) => FlashScreen(),
        SignUpScreen().name: (_) => SignUpScreen(),
        SignInScreen().name: (_) => SignInScreen(),
        ForgotPasswordEmailScreen().name: (_) => ForgotPasswordEmailScreen(),
        OtpVerifyScreen().name: (_) => OtpVerifyScreen(),
      },
    );
  }
}
