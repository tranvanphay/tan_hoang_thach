import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class AboutUsDesktop extends StatelessWidget {
  const AboutUsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppString.aboutUs,
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 7.sp),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Image.asset(
              AppImage.aboutUsImg,
              height: 300.h,
            )),
            SizedBox(
              width: 10.r,
            ),
            Expanded(
              child: Text(
                AppString.aboutUsText,
                style: TextStyle(
                    color: AppColor.textGrey,
                    decoration: TextDecoration.none,
                    fontSize: 4.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
