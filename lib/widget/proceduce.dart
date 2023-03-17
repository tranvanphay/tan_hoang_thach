import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/desktop_font_size.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/utils/strings.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Proceduce extends StatelessWidget {
  final bool isPhone;
  const Proceduce({Key? key, required this.isPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppString.proceduceHeader,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: isPhone
                    ? MobileFontSize.textHeader3
                    : DesktopFontSize.textHeader3),
          ),
        ),
        SizedBox(
          height: isPhone ? 5.h : 15.h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppString.proceduceDetail,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: isPhone
                          ? MobileFontSize.textSizeNormal
                          : DesktopFontSize.textSizeNormal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: isPhone ? 5.h : 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            AppString.proceduce,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: AppColor.textGrey,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: isPhone
                    ? MobileFontSize.textSizeNormal
                    : DesktopFontSize.textSizeNormal),
          ),
        ),
        _timeLine(context),
        Center(
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
        ),
      ],
    );
  }

  Widget _timeLine(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimelineTile(
          lineXY: 0.1,
          beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
          indicatorStyle: _indicatorStyle(context, '1'),
          alignment: TimelineAlign.manual,
          isFirst: true,
          endChild: _Step(
            title: AppString.proceduceTextHeader1,
            desc: AppString.proceduceTextDetail1,
            isPhone: isPhone,
          ),
        ),
        TimelineTile(
          lineXY: 0.1,
          beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
          indicatorStyle: _indicatorStyle(context, '2'),
          alignment: TimelineAlign.manual,
          endChild: _Step(
            title: AppString.proceduceTextHeader2,
            desc: AppString.proceduceTextDetail2,
            isPhone: isPhone,
          ),
        ),
        TimelineTile(
          lineXY: 0.1,
          beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
          indicatorStyle: _indicatorStyle(context, '3'),
          alignment: TimelineAlign.manual,
          endChild: _Step(
            title: AppString.proceduceTextHeader3,
            desc: AppString.proceduceTextDetail3,
            isPhone: isPhone,
          ),
        ),
        TimelineTile(
          lineXY: 0.1,
          isLast: true,
          beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
          indicatorStyle: _indicatorStyle(context, '4'),
          alignment: TimelineAlign.manual,
          endChild: _Step(
            title: AppString.proceduceTextHeader4,
            desc: AppString.proceduceTextDetail4,
            isPhone: isPhone,
          ),
        ),
      ],
    );
  }

  IndicatorStyle _indicatorStyle(BuildContext context, String number) {
    return IndicatorStyle(
        indicatorXY: 0.3,
        width: isPhone ? 40.r : 20.r,
        height: isPhone ? 40.r : 20.r,
        color: Colors.blue,
        drawGap: true,
        indicator: _Indicator(
          number: number,
          isPhone: isPhone,
        ));
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({Key? key, required this.number, required this.isPhone})
      : super(key: key);

  final String number;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.blue,
            width: 2.r,
          ),
        ),
      ),
      child: Center(
        child: Text(number,
            style: GoogleFonts.lobster(
              color: Colors.blue,
              fontSize: isPhone
                  ? MobileFontSize.textSizeSmall
                  : DesktopFontSize.textSizeSmall,
            )),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step(
      {Key? key,
      required this.title,
      required this.desc,
      required this.isPhone})
      : super(key: key);

  final String title;
  final String desc;
  final bool isPhone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: isPhone
                        ? MobileFontSize.textSizeNormal
                        : DesktopFontSize.textSizeNormal,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  desc,
                  style: TextStyle(
                    color: Colors.blue.withOpacity(0.8),
                    fontSize: isPhone
                        ? MobileFontSize.textSizeNormal
                        : DesktopFontSize.textSizeNormal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
