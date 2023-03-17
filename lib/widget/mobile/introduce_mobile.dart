import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class IntroduceMobile extends StatelessWidget {
  const IntroduceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppString.introduceText,
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
          AppImage.introduceImg,
          height: 300.h,
        ),
      ],
    );
  }
}
