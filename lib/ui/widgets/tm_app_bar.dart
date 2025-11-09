import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onTapProfile(){
      if(ModalRoute.of(context)?.settings.name != ProfileScreen().name){
        Navigator.pushNamed(context, ProfileScreen().name);
      }
    }
    final textTheme = Theme.of(context,).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: onTapProfile,
        child: Row(
          spacing: 8,
          children: [
            CircleAvatar(radius: 20,
              backgroundImage: AssetImage('assets/images/profile_img.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Din Islam',
                  style:textTheme.titleMedium?.copyWith(color: Colors.white),
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
    );

  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}