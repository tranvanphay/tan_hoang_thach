import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class HeaderMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      const Positioned.fill(
        child: Image(
          image: AssetImage("assets/bg.jpeg"),
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Màn rèm cao cấp nhập khẩu",
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: 25.spMax,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Tân Hoàng Thạch",
              style: TextStyle(
                  color: AppColor.textBlue,
                  fontSize: 35.spMax,
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
                    color: Colors.black87,
                    fontSize: 20.sp),
                children: [
                  TextSpan(
                    text: 'cực hấp dẫn:',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                        color: Colors.black87),
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
        ),
      )
    ]);
  }

  Widget _endow(String content) {
    return Row(
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
            style: TextStyle(
                fontSize: 18.sp,
                decoration: TextDecoration.none,
                color: AppColor.textGrey),
          ),
        )
      ],
    );
  }
}
