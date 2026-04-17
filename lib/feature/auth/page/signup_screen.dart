import 'package:dentbuy_flutter_app/components/buttons/main_button.dart';
import 'package:dentbuy_flutter_app/components/inputs/custom_text_form_field.dart';
import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/auth/page/otp_screen.dart';
import 'package:dentbuy_flutter_app/feature/auth/page/login_screen.dart';
import 'package:dentbuy_flutter_app/feature/auth/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                     // زرار الرجوع
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                     (context) => const LoginScreen()));
                  },
                ),
              const SizedBox(height: 30),

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

              
                   AuthHeader(title: 'Sign up'),
                  Text(
                    'Create an account to continue our app',
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
          
                onChanged: (value) {},
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: AppColors.graycolor,
                  ), 
              ),

              const SizedBox(height: 30),

              CustomTextFormField(
                labelText: 'Password',
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: AppColors.graycolor,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors.graycolor,
                ),
              ),
              const SizedBox(height: 30),

              CustomTextFormField(
                labelText: 'Confirm Password',
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: AppColors.graycolor,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppColors.graycolor,
                ),
              ),
             
              SizedBox(height: 30),
              MainButton(text: 'Sign up', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen()));
              }),
              SizedBox(height: 30),
             
                   Column(
                              children: [
                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('Or sign in with',
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
                                                SizedBox(height: 12),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: SvgPicture.asset(AppAssets.googleSvg, width:36),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: SvgPicture.asset(AppAssets.faceIconSvg, width: 40),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: SvgPicture.asset(AppAssets.whatsSvg, width: 40),
                                                    ),
                                                  ],
                                                ),
                              ],
                            ),
                     ],
                  )
               
                )
              ),
            ),
      );
    
   }
}
