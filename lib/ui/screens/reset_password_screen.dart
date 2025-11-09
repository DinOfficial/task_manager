import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/log_in_screen.dart';
import 'package:untitled/ui/screens/otp_verify_screen.dart';
import 'package:untitled/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  final String name = '/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ScreenBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const SizedBox(height: 100),
              Text(
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Minimum password length 8 characters with letter and number combination',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextField(decoration: InputDecoration(hintText: 'New Password')),
              TextField(decoration: InputDecoration(hintText: 'Confirm Password')),
              FilledButton(
                onPressed: (){},
                style: FilledButton.styleFrom(),
                child: Icon(Icons.arrow_circle_right_outlined, size: 30,),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'have an account? ',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.green),
                        recognizer: TapGestureRecognizer()..onTap = _signIn,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    Navigator.pushNamed(context, SignInScreen().name);
  }


}
