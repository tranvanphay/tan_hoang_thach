import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class BenefitMobile extends StatelessWidget {
  const BenefitMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 50.w,
            ),
            child: const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          AppString.benefitHeader,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        _benefitItem(context, AppString.benefitText1),
        _benefitItem(context, AppString.benefitText2),
        _benefitItem(context, AppString.benefitText3),
        _benefitItem(context, AppString.benefitText4),
        SizedBox(
          height: 5.h,
        ),
        Image.asset(
          AppImage.benefitImg,
          height: 300.h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 18.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Flexible(
            child: Text(
              content,
              style:
                  TextStyle(fontSize: 18.sp, decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
