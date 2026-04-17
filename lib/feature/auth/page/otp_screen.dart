import 'package:dentbuy_flutter_app/components/buttons/main_button.dart';
import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/extentions/navigation.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/auth/widgets/auth_header.dart';
import 'package:dentbuy_flutter_app/feature/home/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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

                
                   AuthHeader(title: 'OTP Verification'),
                  Text(
                    'Enter the 6-digit code sent to your email address',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.graycolor,
                    ),
                  ),
            
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.graycolor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        cursorColor: AppColors.primary,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend code',
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
                MainButton(text: 'Verify', onPressed: () {
                  pushWithReplacement(context, const HomeScreen());
                }
                ),

              const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
