import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nice_ripple/nice_ripple.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/widget/desktop/about_us_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/benefit_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/footer_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/introduce_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/product_desktop.dart';
import 'package:tan_hoang_thach/widget/floating_action_button.dart';
import 'package:tan_hoang_thach/widget/mobile/about_us_mobile.dart';
import 'package:tan_hoang_thach/widget/mobile/benefit_mobile.dart';
import 'package:tan_hoang_thach/widget/mobile/footer_mobile.dart';
import 'package:tan_hoang_thach/widget/desktop/header_desktop.dart';
import 'package:tan_hoang_thach/widget/mobile/header_mobile.dart';
import 'package:tan_hoang_thach/widget/mobile/introduce_mobile.dart';
import 'package:tan_hoang_thach/widget/proceduce.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widget/mobile/product_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.appBg,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingAction(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.isPhone ? 0 : 50.w),
          child: ResponsiveRowColumn(
            columnMainAxisAlignment: MainAxisAlignment.start,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              context.isPhone
                  ? ResponsiveRowColumnItem(child: HeaderMobile())
                  : ResponsiveRowColumnItem(child: HeaderDesktop()),
              ResponsiveRowColumnItem(
                child: Container(
                  width: double.infinity,
                  height: context.isPhone ? 70.h : 100.h,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: ElevatedButton(
                        onPressed: () {
                          _launchUrl('https://facebook.com/chiasemoithu.net');
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.redAccent),
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Text(
                            "NHẬN ƯU ĐÃI NGAY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: context.isPhone ? 20.sp : 6.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                  child: Center(
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
              )),
              ResponsiveRowColumnItem(
                  child: context.isPhone
                      ? const IntroduceMobile()
                      : const IntroduceDesktop()),
              ResponsiveRowColumnItem(
                  child: Center(
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
              )),
              ResponsiveRowColumnItem(
                  child: context.isPhone
                      ? const AboutUsMobile()
                      : const AboutUsDesktop()),
              ResponsiveRowColumnItem(
                  child: context.isPhone
                      ? const ProductMobile()
                      : const ProductDesktop()),
              ResponsiveRowColumnItem(
                  child: context.isPhone
                      ? const BenefitMobile()
                      : const BenefitDesktop()),
              const ResponsiveRowColumnItem(child: Proceduce()),
              ResponsiveRowColumnItem(
                  child: context.isPhone
                      ? const FooterMobile()
                      : const FooterDesktop()),
            ],
          ),
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    EasyLoading.show();
    final uri = Uri.parse(
      url,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
              mode: LaunchMode.platformDefault, webOnlyWindowName: '_blank')
          .then((value) {
        EasyLoading.dismiss();
      });
    } else {
      EasyLoading.dismiss();
      throw 'Could not launch $url';
    }
  }
}
