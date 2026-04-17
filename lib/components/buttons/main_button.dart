import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
  super.key, 
  required this.text, 
  required this.onPressed, 
  this.height= 50, 
  this.width,
  this.bgcolor,
  });
  final String text;
  final Function() onPressed;
  final double? height;
  final double? width;
  final Color? bgcolor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whitecolor,
          ),
        ),
      ),
    );
  }
}
