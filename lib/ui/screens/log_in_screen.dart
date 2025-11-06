import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/screen_background.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  final String name = '/log-in-screen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ScreenBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              const SizedBox(height: 100),
              Text('Get Started With', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(),
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    TextButton(onPressed: (){}, child: Text('Forgot Password?', style: TextStyle(fontSize: 18),)),
                    RichText(text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                        children: [
                          TextSpan(text: 'Sign Up', style: TextStyle(color: Colors.green), recognizer: TapGestureRecognizer()..onTap = () {} )
                        ]
                    ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


  void _onNavigate(){}

  void _onForgotPassword(){}

  void _onSignUp(){}

}
