import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nice_ripple/nice_ripple.dart';
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/desktop_font_size.dart';
import '../utils/mobile_font_size.dart';

class FloatingAction extends StatelessWidget {
  final bool isPhone;
  const FloatingAction({Key? key, required this.isPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isPhone ? 20.w : 8.w, vertical: isPhone ? 16.h : 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: isPhone ? 90.r : 70.r,
                height: isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn1",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    _launchUrl(AppString.zaloPage);
                  },
                  child: NiceRipple(
                    child: SvgPicture.asset(
                      AppImage.zaloIcon,
                      semanticsLabel: 'Zalo',
                      width: isPhone ? 70.r : 48.r,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isPhone ? 10.h : 20.h,
              ),
              SizedBox(
                width: isPhone ? 90.r : 70.r,
                height: isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn4",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    _makePhoneCall(AppString.hotline2);
                  },
                  child: NiceRipple(
                    rippleColor: const Color.fromARGB(255, 0, 200, 83),
                    radius: 100,
                    rippleShape: BoxShape.circle,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.phone_rounded,
                      color: const Color.fromARGB(255, 247, 147, 30),
                      size: isPhone ? 60.r : 40.r,
                    ),
                  ),
                ),
              ),
              Text(
                'Đà Nẵng',
                style: TextStyle(
                    color: const Color.fromARGB(255, 247, 147, 30),
                    fontSize: isPhone
                        ? MobileFontSize.textSizeSmall
                        : DesktopFontSize.textSizeSmall),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: isPhone ? 90.r : 70.r,
                height: isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn2",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    //Gọi 2 lần để không bị lỗi trên ip12 ios 16
                    if (isPhone) {
                      _launchUrl(AppString.messenger);
                      _launchUrl(AppString.messenger);
                    } else {
                      _launchUrl(AppString.messenger);
                    }
                  },
                  child: NiceRipple(
                    rippleColor: Colors.red,
                    radius: 100,
                    rippleShape: BoxShape.circle,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: SvgPicture.asset(
                      AppImage.messIcon,
                      semanticsLabel: 'Messenger',
                      width: isPhone ? 70.r : 48.r,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isPhone ? 10.h : 20.h,
              ),
              SizedBox(
                width: isPhone ? 90.r : 70.r,
                height: isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn3",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    _makePhoneCall(AppString.hotline1);
                  },
                  child: NiceRipple(
                    rippleColor: const Color.fromARGB(255, 0, 200, 83),
                    radius: 100,
                    rippleShape: BoxShape.circle,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.phone_rounded,
                      color: const Color.fromARGB(255, 247, 147, 30),
                      size: isPhone ? 60.r : 40.r,
                    ),
                  ),
                ),
              ),
              Text(
                'Hồ Chí Minh',
                style: TextStyle(
                    color: const Color.fromARGB(255, 247, 147, 30),
                    fontSize: isPhone
                        ? MobileFontSize.textSizeSmall
                        : DesktopFontSize.textSizeSmall),
              ),
            ],
          )
        ],
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
