import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/paths/assets_path.dart';
import 'package:flutter_platzi_clone/presentation/colors.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/custom_primary_button.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/custom_text_form_field.dart';
import 'package:flutter_platzi_clone/presentation/common_widgets/rounded_blur_container.dart';
import 'package:flutter_platzi_clone/presentation/routes/app_router.dart';
import 'package:flutter_platzi_clone/services/client_appwrite.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                      'Rellena tus datos\nPara iniciar sesión',
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const SignInForm(),
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

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            controller: emailController,
            isPassword: false,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
          ),
          SizedBox(height: 20.h),
          CustomPrimaryButton(
            text: 'Iniciar Sesión',
            color: secondaryColor,
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              if (_formKey.currentState!.validate()) {
                bool status = await ClientAppwrite()
                    .login(emailController.text, passwordController.text);
                if (status) {
                  if (!mounted) return;
                  Navigator.pushNamed(context, AppRouter.home);
                }
              }
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
