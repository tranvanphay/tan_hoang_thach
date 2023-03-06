import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/widget/header_desktop.dart';
import 'package:tan_hoang_thach/widget/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
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
                shakeConstant: ShakeLittleConstant2(),
                autoPlay: true,
                enableWebMouseHover: true,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.redAccent),
                  child: Text(
                    "Nhận ưu đãi ngay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.isPhone ? 20.sp : 12.sp),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
