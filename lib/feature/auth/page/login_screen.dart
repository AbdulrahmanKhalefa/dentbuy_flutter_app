import 'package:dentbuy_flutter_app/components/buttons/main_button.dart';
import 'package:dentbuy_flutter_app/components/inputs/custom_text_form_field.dart';
import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/extentions/navigation.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/auth/page/otp_screen.dart';
import 'package:dentbuy_flutter_app/feature/auth/page/signup_screen.dart';
import 'package:dentbuy_flutter_app/feature/auth/widgets/auth_header.dart';
import 'package:dentbuy_flutter_app/feature/home/page/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),

                  Center(
                    child: SvgPicture.asset(
                      AppAssets.logoSvg,
                      width: 150,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  AuthHeader(title: 'Sign in'),
                  Text(
                    'Please sign in to continue our app',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.graycolor,
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    labelText: 'Email',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: AppColors.graycolor,
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    labelText: 'Password',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Password';
                      } else if (value!.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primary,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.graycolor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        pushWithReplacement(context, MainNavigationScreen());
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.graycolor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pushWithReplacement(context, SignupScreen());
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or sign in with',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.graycolor,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppAssets.googleSvg,
                              width: 48,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppAssets.faceIconSvg,
                              width: 48,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppAssets.whatsSvg,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
