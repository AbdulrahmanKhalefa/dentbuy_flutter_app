import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),

        Text(
          title,
          style: TextStyle(
            fontSize: 28, 
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
