import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/paths/assets_path.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/custom_primary_button.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/rounded_blur_container.dart';
import 'package:flutter_platzi_clone/presentation/routes/app_router.dart';
import 'package:flutter_platzi_clone/services/client_appwrite.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: REdgeInsets.symmetric(horizontal: 20),
                height: 0.5.sh,
                child: Stack(
                  children: [
                    // JavaScript
                    Positioned(
                      top: 87.h,
                      left: 39.w,
                      child: RoundedBlurContainer(
                        imagePath: jsIconPath,
                        color: jsColor,
                        angle: -12,
                        width: 86.h,
                        height: 86.h,
                      ),
                    ),
                    // Figma
                    Positioned(
                      top: 48.h,
                      right: 37.w,
                      child: RoundedBlurContainer(
                        imagePath: figmaIconPath,
                        color: figmaColor,
                        angle: -12,
                        width: 117.h,
                        height: 117.h,
                      ),
                    ),
                    //   // Css
                    Positioned(
                      bottom: 71.h,
                      left: 48.w,
                      child: RoundedBlurContainer(
                        imagePath: cssIconPath,
                        color: cssColor,
                        angle: 12,
                        width: 86.h,
                        height: 86.h,
                      ),
                    ),
                    //   // Python
                    Positioned(
                      bottom: 53.h,
                      right: 45.w,
                      child: RoundedBlurContainer(
                        imagePath: pythonIconPath,
                        color: pythonColor,
                        angle: -12,
                        width: 102.h,
                        height: 102.h,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Logra todas tus\nmetas ahora',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Cursos online para especializarte en las\nprofesiones que lideran el mercado hoy.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    // Sign in
                    CustomPrimaryButton(
                      text: 'Iniciar sesi??n',
                      color: secondaryColor,
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRouter.signIn),
                    ),
                    SizedBox(height: 20.h),
                    // Sign up
                    CustomSecondaryButton(
                      text: 'Crear cuenta',
                      color: secondaryColor,
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRouter.signUp),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          ClientAppwrite().loginAnonymous();
                          Navigator.pushNamed(context, AppRouter.home);
                        },
                        child: Text(
                          'Iniciar m??s tarde',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
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
        border: Border.all(color: Colors.white),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
