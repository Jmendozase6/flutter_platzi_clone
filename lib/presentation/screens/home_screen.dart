import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/paths/assets_path.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/search_bar.dart';
import 'package:flutter_platzi_clone/presentation/screens/onboarding_screen.dart';
import 'package:flutter_platzi_clone/services/client_appwrite.dart';
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
          GestureDetector(
            onTap: () {
              ClientAppwrite().logOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
                  (route) => false);
            },
            child: SvgPicture.asset(
              notificationIcon,
              fit: BoxFit.scaleDown,
            ),
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
        child: SingleChildScrollView(
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
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 180.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) {
                    return const CourseInfo();
                  },
                ),
              ),
              SizedBox(height: 24.h),
              // Banner
              const HomeBanner()
            ],
          ),
        ),
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(right: 15.w),
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Aprende sobre la nube',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(instructorIcon),
              SizedBox(width: 5.w),
              Text(
                'Héctor Vega',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              SizedBox(width: 15.w),
              SvgPicture.asset(studentsIcon),
              SizedBox(width: 5.w),
              Text(
                '2k alumnos',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            width: 70.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: itemInfoColor.withOpacity(0.21),
              borderRadius: BorderRadius.circular(7.5),
            ),
            child: Center(
              child: Text(
                'Nube con azure',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: itemInfoColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(colors: [
          const Color(0XFF9D4D52).withOpacity(0.37),
          const Color(0XFF101E3B),
          const Color(0XFF94B061).withOpacity(0.51),
        ], transform: const GradientRotation(-94)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            banner,
            fit: BoxFit.fitHeight,
          ),
          Text(
            'Accede a más de 700 cursos\nadquiriendo un  plan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 13.sp,
            ),
          )
        ],
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
              fit: BoxFit.scaleDown,
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
