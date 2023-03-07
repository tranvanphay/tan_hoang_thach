import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BenefitMobile extends StatelessWidget {
  const BenefitMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isPhone ? 5.h : 15.h,
              horizontal: 50.w,
            ),
            child: const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          'Lợi ích của màn rèm trong không gian nhà',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: context.isPhone ? 25.sp : 7.sp),
        ),
        SizedBox(
          height: context.isPhone ? 5.h : 15.h,
        ),
        _benefitItem(context,
            'Tính thẩm mĩ cao, giúp không gian nhà bạn sang trọng hơn'),
        _benefitItem(context, 'Cản nắng gió và cách nhiệt rất tốt'),
        _benefitItem(context, 'Dễ dàng tháo lắp và vệ sinh'),
        _benefitItem(context, 'Tiện lợi, thông minh, không lỗi thời'),
        SizedBox(
          height: context.isPhone ? 5.h : 15.h,
        ),
        Image.asset(
          'assets/desktop/benefit.jpg',
          height: 300.h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isPhone ? 5.h : 15.h,
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

  ResponsiveRowColumnItem _benefitItem(BuildContext context, String content) {
    return ResponsiveRowColumnItem(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.isPhone ? 20.w : 10.w),
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: context.isPhone ? 18.w : 4.w,
              ),
            ),
            ResponsiveRowColumnItem(
              child: SizedBox(
                width: context.isPhone ? 3.w : 2.w,
              ),
            ),
            ResponsiveRowColumnItem(
              child: Flexible(
                child: Text(
                  content,
                  style: TextStyle(
                      fontSize: context.isPhone ? 18.sp : 4.sp,
                      decoration: TextDecoration.none),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
