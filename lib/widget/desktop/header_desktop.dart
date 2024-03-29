import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/desktop_font_size.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(AppImage.backgroundHeaderDesktop),
      Positioned(
          top: 10.h,
          left: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.manRemCaoCapNhapKhau,
                style: TextStyle(
                    color: AppColor.textGrey,
                    fontSize: DesktopFontSize.textHeader2,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppString.brand,
                style: TextStyle(
                    color: AppColor.textBlue,
                    fontSize: DesktopFontSize.textHeader1,
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
                      fontSize: DesktopFontSize.textHeader3,
                      color: AppColor.textGrey),
                  children: [
                    TextSpan(
                      text: AppString.cucHapDan,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: DesktopFontSize.textHeader3,
                          color: Colors.black45),
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
              fontSize: DesktopFontSize.textSizeBig,
              decoration: TextDecoration.none,
              color: Colors.red),
        )
      ],
    );
  }
}
