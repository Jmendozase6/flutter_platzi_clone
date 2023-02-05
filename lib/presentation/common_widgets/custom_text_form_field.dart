import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: searchBarColor,
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Debe rellenar este campo';
          }
          if (isPassword) {
            if (value.length < 8) {
              return 'Use más de 8 caractéres';
            }
          }
          return null;
        },
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
