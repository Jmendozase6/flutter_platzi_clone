import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/paths/assets_path.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Courses name
  final coursesName = [
    'Desarrollo',
    'Diseño UI/UX',
    'Marketing',
    'Negocios',
    'Startup'
  ];

  // Courses pictures
  final coursesPics = [
    developPic,
    designPic,
    marketingPic,
    bussinessPic,
    startupPic
  ];

  // Courses Colors
  final coursesColors = [
    developColor,
    designColor,
    marketingColor,
    bussinessColor,
    startupColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: SvgPicture.asset(
          appIconPath,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          SvgPicture.asset(
            notificationIcon,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(width: 20.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 37.h),
            Text(
              '¿Qué vas a aprender hoy?',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24.h),
            const SearchBar(),
            SizedBox(height: 24.h),
            const TitleButtonSection(text: 'Cursos'),
            SizedBox(height: 24.h),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: coursesName.length,
                itemBuilder: (_, int index) {
                  return CourseItem(
                    pic: coursesPics[index],
                    title: coursesName[index],
                    color: coursesColors[index],
                  );
                },
              ),
            ),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aprende Gratis',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    _Dot(isSelected: true),
                    _Dot(isSelected: false),
                    _Dot(isSelected: false),
                    _Dot(isSelected: false),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: isSelected ? 16.w : 4.w,
      decoration: BoxDecoration(
        color: isSelected ? secondaryColor : bubbleColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
      margin: EdgeInsets.only(right: 5.w),
    );
  }
}

class TitleButtonSection extends StatelessWidget {
  const TitleButtonSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          'Ver todos',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CourseItem extends StatelessWidget {
  const CourseItem({
    Key? key,
    required this.pic,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String pic;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        children: [
          Container(
            height: 68.h,
            width: 68.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Image(
              image: AssetImage(pic),
              width: 30,
            ),
          ),
          SizedBox(height: 13.h),
          Text(
            title,
            style: TextStyle(fontSize: 10.sp, color: Colors.white),
          )
        ],
      ),
    );
  }
}

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
