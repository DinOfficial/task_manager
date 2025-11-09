import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/forgot_password_email_screen.dart';
import 'package:untitled/ui/screens/main_bottom_nav_holder_screen.dart';
import 'package:untitled/ui/screens/sign_up_screen.dart';
import 'package:untitled/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  final String name = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                'Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              FilledButton(
                onPressed: _onTapSignIn,
                style: FilledButton.styleFrom(),
                child: Icon(Icons.arrow_circle_right_outlined, size: 30,),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: _onForgotPasswordEmail,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Colors.green),
                            recognizer: TapGestureRecognizer()..onTap = _onSignUp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onForgotPasswordEmail() {
    Navigator.pushNamed(context, ForgotPasswordEmailScreen().name);
  }

  void _onSignUp() {
    Navigator.pushNamed(context, SignUpScreen().name);
  }

  void _onTapSignIn() {
    Navigator.pushReplacementNamed(context, MainBottomNavHolderScreen().name);
  }
}
