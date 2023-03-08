import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/widget/desktop/about_us_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/benefit_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/footer_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/introduce_desktop.dart';
import 'package:tan_hoang_thach/widget/desktop/product_desktop.dart';
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
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                onPressed: () {
                  EasyLoading.showToast("Éo có gì đâu");
                },
                child: ShakeWidget(
                    duration: const Duration(seconds: 3),
                    shakeConstant: ShakeDefaultConstant2(),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    child: SvgPicture.asset(
                      'assets/icon/ic_messenger.svg',
                      semanticsLabel: 'Messenger',
                      width: context.isPhone ? 96.r : 48.r,
                    )),
              ),
              FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                onPressed: () {
                  _makePhoneCall('0369391202');
                },
                child: ShakeWidget(
                  duration: const Duration(seconds: 3),
                  shakeConstant: ShakeDefaultConstant2(),
                  autoPlay: true,
                  enableWebMouseHover: true,
                  child: Icon(
                    Icons.phonelink_ring_outlined,
                    color: Colors.blue,
                    size: context.isPhone ? 56.r : 48.r,
                  ),
                ),
              )
            ],
          ),
        ),
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
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: ShakeWidget(
                      duration: const Duration(seconds: 3),
                      shakeConstant: ShakeDefaultConstant2(),
                      autoPlay: true,
                      enableWebMouseHover: true,
                      child: ElevatedButton(
                        onPressed: () {
                          EasyLoading.showToast("Bấm cc..., đang làm",
                              duration: const Duration(seconds: 2));
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
