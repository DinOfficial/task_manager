import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/services/network_caller.dart';
import 'package:untitled/data/utils/urls.dart';
import 'package:untitled/data/utils/validation.dart';
import 'package:untitled/ui/screens/log_in_screen.dart';
import 'package:untitled/ui/screens/otp_verify_screen.dart';
import 'package:untitled/ui/widgets/screen_background.dart';
import 'package:untitled/ui/widgets/show_snackbar_message.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  final String name = '/forgot-password-email';

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  bool _emailVerifyInProgress = false;
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ScreenBackground(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 6 digit verification code will be sent to this email address',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) =>AllValidation().formValidation(value, 'Please input valid email') ,
                ),
                FilledButton(
                  onPressed: _moveNextScreen,
                  style: FilledButton.styleFrom(),
                  child: Icon(Icons.arrow_circle_right_outlined, size: 30),
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
      ),
    );
  }

  void _signIn() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen().name, (p)=>false);
  }

  void _moveNextScreen() {
    if(_formKey.currentState!.validate()){
      _emailVerify();
    }
  }

  Future<void> _emailVerify()async{
    _emailVerifyInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetWorkCaller().getRequest(Urls.emailVerify(_emailController.text.trim()));
    
    if(response.isSuccess){
      showSnackbarMessage(context, response.body['data']);

      if(response.body['status'] == 'success'){
        Navigator.pushNamed(context, OtpVerifyScreen().name);
      }

    }else{
      showSnackbarMessage(context, 'This email is not registerd', true);
    }

    _emailVerifyInProgress = false;
    setState(() {});
    
  }

}
