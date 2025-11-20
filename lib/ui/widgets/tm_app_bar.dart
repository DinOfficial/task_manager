import 'package:flutter/material.dart';
import 'package:untitled/data/utils/auth_controller.dart';
import 'package:untitled/ui/screens/log_in_screen.dart';
import 'package:untitled/ui/screens/profile_screen.dart';
class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({super.key});

  @override
  State<TMAppBar> createState() => _TMAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
class _TMAppBarState extends State<TMAppBar> {

  @override
  Widget build(BuildContext context) {
    void onTapProfile() {
      if (ModalRoute.of(context)?.settings.name != ProfileScreen().name) {
        Navigator.pushNamed(context, ProfileScreen().name);
      }
    }
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: onTapProfile,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile_img.png'),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Din Islam',
                  style: textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                Text(
                  'shdinofficial19@gmail.com',
                  style: textTheme.labelSmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            AuthController.clearUserData();
            Navigator.pushReplacementNamed(context, SignInScreen().name);
          },
          icon: Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}
