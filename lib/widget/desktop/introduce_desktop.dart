import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class IntroduceDesktop extends StatelessWidget {
  const IntroduceDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            AppString.introduceText,
            style: TextStyle(
                color: AppColor.textGrey,
                decoration: TextDecoration.none,
                fontSize: 4.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: Image.asset(
          AppImage.introduceImg,
          height: 300.h,
        ))
      ],
    );
  }
}
