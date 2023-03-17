import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.aboutUs,
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: MobileFontSize.textHeader3),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          AppString.aboutUsText,
          style: TextStyle(
              color: AppColor.textGrey,
              decoration: TextDecoration.none,
              fontSize: MobileFontSize.textSizeNormal),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5.h,
        ),
        Image.asset(
          AppImage.aboutUsImg,
          height: 300.h,
        ),
      ],
    );
  }
}
