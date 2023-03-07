import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class IntroduceMobile extends StatelessWidget {
  const IntroduceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tân Hoàng Thạch là cơ sở sản xuất, thi công màn rèm uy tín với hơn 10 năm kinh nghiệm, mạng lưới phân phối lớn ở các tỉnh miền Trung, miền Nam và các tỉnh lân cận. Chúng tôi luôn đặt ví trí khách hàng lên hàng đầu với tiêu chí “ Người thật - Việc thật ”',
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
          'assets/desktop/introduce.jpg',
          height: 300.h,
        ),
      ],
    );
  }
}
