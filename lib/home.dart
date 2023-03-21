import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/desktop_font_size.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBg,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingAction(
        isPhone: context.isPhone,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding:
                EdgeInsets.symmetric(horizontal: context.isPhone ? 0 : 50.w),
            child: context.isPhone ? _homeMobile() : _homeDesktop()),
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

  Column _homeMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HeaderMobile(),
        _benefitButton(true),
        _benefitPadding(true),
        const IntroduceMobile(),
        _introducePadding(true),
        const AboutUsMobile(),
        const ProductMobile(),
        const BenefitMobile(),
        const Proceduce(
          isPhone: true,
        ),
        const FooterMobile(),
      ],
    );
  }

  Column _homeDesktop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HeaderDesktop(),
        _benefitButton(false),
        _benefitPadding(false),
        const IntroduceDesktop(),
        _introducePadding(false),
        const AboutUsDesktop(),
        const ProductDesktop(),
        const BenefitDesktop(),
        const Proceduce(
          isPhone: false,
        ),
        const FooterDesktop(),
      ],
    );
  }

  Widget _benefitButton(bool isPhone) {
    return SizedBox(
      width: double.infinity,
      height: isPhone ? 70.h : 100.h,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5.h),
          child: ElevatedButton(
            onPressed: () {
              _launchUrl(AppString.fanpage);
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), primary: Colors.redAccent),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                AppString.getBenefitNow,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: isPhone
                        ? MobileFontSize.textHeader3
                        : DesktopFontSize.textHeader3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _benefitPadding(bool isPhone) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isPhone ? 5.h : 15.h,
          horizontal: 50.w,
        ),
        child: const Divider(
          thickness: 1,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _introducePadding(bool isPhone) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isPhone ? 5.h : 15.h,
          horizontal: 50.w,
        ),
        child: const Divider(
          thickness: 1,
          color: Colors.blue,
        ),
      ),
    );
  }
}
