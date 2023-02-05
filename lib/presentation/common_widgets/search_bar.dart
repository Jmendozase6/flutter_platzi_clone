import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/paths/assets_path.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.sw,
      decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20.w),
          SvgPicture.asset(searchIcon),
          SizedBox(width: 12.w),
          Text(
            '¿Qué te gustaría aprender hoy?',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
