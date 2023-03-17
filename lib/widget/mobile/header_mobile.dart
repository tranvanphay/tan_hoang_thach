import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/images.dart';

import '../../utils/strings.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      const Positioned.fill(
        child: Image(
          image: AssetImage(AppImage.backgroundHeaderMobile),
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.manRemCaoCapNhapKhau,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: 25.spMax,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppString.brand,
              style: TextStyle(
                  color: AppColor.textBlue,
                  fontSize: 35.spMax,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 12,
            ),
            RichText(
              text: TextSpan(
                text: AppString.uuDai,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 20.sp),
                children: [
                  TextSpan(
                    text: AppString.cucHapDan,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.sp,
                        color: AppColor.textGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _endow(AppString.mienPhiLapDat),
            const SizedBox(
              height: 8,
            ),
            _endow(AppString.baoGiaTaiNha),
            const SizedBox(
              height: 8,
            ),
            _endow(AppString.giam10PhanTram),
            const SizedBox(
              height: 8,
            ),
            _endow(AppString.baoHanhHaiNam),
            const SizedBox(
              height: 8,
            ),
            _endow(AppString.giaNhapTaiXuong),
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
