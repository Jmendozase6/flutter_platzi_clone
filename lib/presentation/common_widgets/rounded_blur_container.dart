import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedBlurContainer extends StatelessWidget {
  //
  final Color color;
  final double angle;
  final double width;
  final double height;
  final String imagePath;

  const RoundedBlurContainer({
    super.key,
    required this.color,
    required this.angle,
    required this.width,
    required this.height,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.8),
              spreadRadius: 0,
              blurRadius: 120,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(
          imagePath,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
