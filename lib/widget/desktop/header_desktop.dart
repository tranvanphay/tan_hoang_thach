import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class HeaderDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/header_bg.png"),
      Positioned(
          top: 10.h,
          left: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Màn rèm cao cấp nhập khẩu",
                style: TextStyle(
                    color: AppColor.textGrey,
                    fontSize: 8.spMax,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Tân Hoàng Thạch",
                style: TextStyle(
                    color: AppColor.textBlue,
                    fontSize: 10.spMax,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: 'Ưu đãi ',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 6.sp,
                      color: AppColor.textGrey),
                  children: [
                    TextSpan(
                      text: 'cực hấp dẫn:',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 6.sp,
                          color: Colors.black45),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _endow('Miễn phí tư vấn, lắp đặt'),
              const SizedBox(
                height: 8,
              ),
              _endow('Nhân viên tư vấn, báo giá tại nhà'),
              const SizedBox(
                height: 8,
              ),
              _endow('Giảm 10% cho đơn hàng trên 10tr '),
              const SizedBox(
                height: 8,
              ),
              _endow('Bảo hành 2 năm'),
              const SizedBox(
                height: 8,
              ),
              _endow('Giá nhập tại xưởng, không qua trung gian'),
            ],
          ))
    ]);
  }

  Widget _endow(String content) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 5.w,
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: 5.sp,
              decoration: TextDecoration.none,
              color: Colors.red),
        )
      ],
    );
  }
}
