import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: color,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
