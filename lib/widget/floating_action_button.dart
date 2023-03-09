import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nice_ripple/nice_ripple.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.isPhone ? 20.w : 8.w,
          vertical: context.isPhone ? 16.h : 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: context.isPhone ? 90.r : 70.r,
                height: context.isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn1",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    _launchUrl('http://zalo.me/0369391202');
                  },
                  child: NiceRipple(
                    child: SvgPicture.asset(
                      'assets/icon/ic_zalo.svg',
                      semanticsLabel: 'Zalo',
                      width: context.isPhone ? 70.r : 48.r,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.isPhone ? 10.h : 20.h,
              ),
              SizedBox(
                width: context.isPhone ? 90.r : 70.r,
                height: context.isPhone ? 90.r : 70.r,
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "btn2",
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  onPressed: () {
                    //Gọi 2 lần để không bị lỗi trên ip12 ios 16
                    if (context.isPhone) {
                      _launchUrl('http://m.me/chiasemoithu.net');
                      _launchUrl('http://m.me/chiasemoithu.net');
                    } else {
                      _launchUrl('http://m.me/chiasemoithu.net');
                    }
                  },
                  child: NiceRipple(
                    rippleColor: Colors.red,
                    radius: 100,
                    rippleShape: BoxShape.circle,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: SvgPicture.asset(
                      'assets/icon/ic_messenger.svg',
                      semanticsLabel: 'Messenger',
                      width: context.isPhone ? 70.r : 48.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: context.isPhone ? 90.r : 70.r,
            height: context.isPhone ? 90.r : 70.r,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: "btn3",
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              onPressed: () {
                _makePhoneCall('0369391202');
              },
              child: NiceRipple(
                rippleColor: const Color.fromARGB(255, 0, 255, 0),
                radius: 100.w,
                rippleShape: BoxShape.circle,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.phone_rounded,
                  color: Colors.white,
                  size: context.isPhone ? 60.r : 48.r,
                ),
              ),
            ),
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
