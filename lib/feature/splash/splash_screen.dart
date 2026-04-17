import 'package:dentbuy_flutter_app/core/constants/App_assets.dart';
import 'package:dentbuy_flutter_app/core/extentions/navigation.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/auth/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //delay for 3 seconds then push to login screen
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        pushWithReplacement(context, LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: SvgPicture.asset(AppAssets.logoSvg, width: 140)),
    );
  }
}
