import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/ui/screens/log_in_screen.dart';
import 'package:untitled/ui/utils/asset_path.dart';
import 'package:untitled/ui/widgets/screen_background.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  final String name = '/flash-screen';

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Center(child: SvgPicture.asset(AssetPath.logoSVG, width: 120))),
    );
  }
}
