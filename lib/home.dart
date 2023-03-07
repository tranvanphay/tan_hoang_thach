import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/widget/benefit.dart';
import 'package:tan_hoang_thach/widget/footer_desktop.dart';
import 'package:tan_hoang_thach/widget/footer_mobile.dart';
import 'package:tan_hoang_thach/widget/header_desktop.dart';
import 'package:tan_hoang_thach/widget/header_mobile.dart';
import 'package:tan_hoang_thach/widget/proceduce.dart';
import 'package:url_launcher/url_launcher.dart';

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
          padding: EdgeInsets.all(8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.transparent,
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
                      width: 48.r,
                    )),
              ),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
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
                    size: 48.r,
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
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
                            shape: StadiumBorder(), primary: Colors.redAccent),
                        child: Text(
                          "NHẬN ƯU ĐÃI NGAY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: context.isPhone ? 20.sp : 12.sp),
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
                  child: Center(
                child: Text(
                  'THÔNG TIN SẢN PHẨM',
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: context.isPhone ? 25.sp : 12.sp),
                ),
              )),
              ResponsiveRowColumnItem(
                  child: SizedBox(
                height: context.isPhone ? 5.h : 15.h,
              )),
              ResponsiveRowColumnItem(
                  child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    'Tân Hoàng Thạch là cơ sở sản xuất, thi công màn rèm uy tín với hơn 10 năm kinh nghiệm, mạng lưới phân phối lớn ở các tỉnh miền Trung, miền Nam và các tỉnh lân cận. Chúng tôi luôn đặt ví trí khách hàng lên hàng đầu với tiêu chí “ Người thật - Việc thật ”',
                    style: TextStyle(
                        color: AppColor.textGrey,
                        decoration: TextDecoration.none,
                        fontSize: context.isPhone ? 18.sp : 10.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
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
                  child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tân Hoàng Thạch chuyên thi công, thiết kế màn rèm cho nhà ở, văn phòng, chung cư hay địa điểm kinh doanh với mẫu mã đa dạng, độ thẩm mĩ cao phù hợp với mọi không gian. Sản phẩm của chúng tôi mang độ bền cao, dễ dàng tháo - lắp, vệ sinh. ',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: context.isPhone ? 18.sp : 10.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )),
              const ResponsiveRowColumnItem(child: Benefit()),
              const ResponsiveRowColumnItem(child: Proceduce()),
              ResponsiveRowColumnItem(
                  child: context.isPhone ? FooterMobile() : FooterDesktop()),
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
