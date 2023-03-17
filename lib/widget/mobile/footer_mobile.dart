import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        color: Colors.blueGrey,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppString.contactInfo,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MobileFontSize.textHeader3,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      AppString.address1,
                      style: _contentStyle,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      AppString.address2,
                      style: _contentStyle,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      AppString.email,
                      style: _contentStyle,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      AppString.phoneNumber,
                      style: _contentStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _contentStyle =>
      TextStyle(fontSize: MobileFontSize.textSizeNormal, color: Colors.white);
}
