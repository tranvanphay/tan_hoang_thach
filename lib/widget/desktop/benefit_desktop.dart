import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/desktop_font_size.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class BenefitDesktop extends StatelessWidget {
  const BenefitDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 50.w,
            ),
            child: const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppString.benefitHeader,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: DesktopFontSize.textHeader3),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                _benefitItem(context, AppString.benefitText1),
                SizedBox(
                  height: 10.h,
                ),
                _benefitItem(context, AppString.benefitText2),
                SizedBox(
                  height: 10.h,
                ),
                _benefitItem(context, AppString.benefitText3),
                SizedBox(
                  height: 10.h,
                ),
                _benefitItem(context, AppString.benefitText4),
              ],
            )),
            Expanded(
                child: Image.asset(
              AppImage.benefitImg,
              height: 300.h,
            ))
          ],
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 50.w,
            ),
            child: const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _benefitItem(BuildContext context, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 18.r,
          ),
          SizedBox(
            width: 2.w,
          ),
          Flexible(
            child: Text(
              content,
              style: TextStyle(
                  fontSize: DesktopFontSize.textSizeNormal,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
