import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/tm_app_bar.dart';

import '../widgets/screen_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  final String name = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: ScreenBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const SizedBox(height: 30),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(decoration: InputDecoration(prefixText: 'Photo')),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'First Name')),
              TextField(decoration: InputDecoration(hintText: 'Last Name')),
              TextField(decoration: InputDecoration(hintText: 'Mobile')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(),
                child: Icon(Icons.arrow_circle_right_outlined, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
