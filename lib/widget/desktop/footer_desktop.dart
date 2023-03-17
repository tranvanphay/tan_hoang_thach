import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/desktop_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        color: Colors.blueGrey,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.contactInfo,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: DesktopFontSize.textHeader3,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppString.address1,
                    style: _contentStyle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppString.address2,
                    style: _contentStyle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppString.email,
                    style: _contentStyle,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppString.phoneNumber,
                    style: _contentStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _contentStyle =>
      TextStyle(fontSize: DesktopFontSize.textSizeNormal, color: Colors.white);
}
