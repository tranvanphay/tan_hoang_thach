import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Về chúng tôi',
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: context.isPhone ? 25.sp : 7.sp),
        ),
        SizedBox(
          height: context.isPhone ? 5.h : 15.h,
        ),
        Text(
          'Tân Hoàng Thạch chuyên thi công, thiết kế màn rèm cho nhà ở, văn phòng, chung cư hay địa điểm kinh doanh với mẫu mã đa dạng, độ thẩm mĩ cao phù hợp với mọi không gian. Sản phẩm của chúng tôi mang độ bền cao, dễ dàng tháo - lắp, vệ sinh.',
          style: TextStyle(
              color: AppColor.textGrey,
              decoration: TextDecoration.none,
              fontSize: context.isPhone ? 18.sp : 4.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.isPhone ? 5.h : 15.h,
        ),
        Image.asset(
          'assets/desktop/worker.jpg',
          height: 300.h,
        ),
      ],
    );
  }
}
