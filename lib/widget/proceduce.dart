import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Proceduce extends StatelessWidget {
  const Proceduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumnItem(
            child: Center(
          child: Text(
            'BẠN ĐANG TÌM ĐƠN VỊ CUNG CẤP MÀN RÈM UY TÍN?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: context.isPhone ? 25.sp : 7.sp),
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
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hãy đến với chúng tôi, Màn rèm Tân Hoàng Thạch cam kết đem đến những sản phẩm tốt nhất, giá cả cạnh tranh, không qua trung gian hay bất kì đơn vị nào khác.',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: context.isPhone ? 18.sp : 4.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )),
        ResponsiveRowColumnItem(
            child: SizedBox(
          height: context.isPhone ? 5.h : 15.h,
        )),
        ResponsiveRowColumnItem(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            'Quy trình làm rèm tại Tân Hoàng Thạch :',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: AppColor.textGrey,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: context.isPhone ? 18.sp : 4.sp),
          ),
        )),
        _timeLine(context),
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
      ],
    );
  }

  ResponsiveRowColumnItem _timeLine(BuildContext context) {
    return ResponsiveRowColumnItem(
        child: ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumnItem(
          child: TimelineTile(
            lineXY: 0.1,
            beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
            indicatorStyle: IndicatorStyle(
                indicatorXY: 0.3,
                width: 20.r,
                height: 20.r,
                color: Colors.blue,
                drawGap: true,
                indicator: const _Indicator(
                  number: '1',
                )),
            alignment: TimelineAlign.manual,
            isFirst: true,
            endChild: const _Step(
              title: 'Khảo sát nhu cầu:',
              desc:
                  'Tìm hiểu nhu cầu của khách hàng qua các kênh của Tân Hoàng Thạch để lựa chọn kiểu rèm, loại vải cho phù hợp',
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: TimelineTile(
            lineXY: 0.1,
            beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
            indicatorStyle: IndicatorStyle(
                width: 20.r,
                indicatorXY: 0.3,
                height: 20.r,
                color: Colors.blue,
                drawGap: true,
                indicator: const _Indicator(
                  number: '2',
                )),
            alignment: TimelineAlign.manual,
            endChild: const _Step(
              title: 'Khảo sát và tư vấn tại nhà:',
              desc:
                  'Tân Hoàng Thạch sẽ điều phối nhân viên đến để khảo sát, tư vấn màu vải để phù hợp với tông màu nhà của bạn',
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: TimelineTile(
            lineXY: 0.1,
            beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
            indicatorStyle: IndicatorStyle(
                width: 20.r,
                height: 20.r,
                indicatorXY: 0.3,
                color: Colors.blue,
                drawGap: true,
                indicator: const _Indicator(
                  number: '3',
                )),
            alignment: TimelineAlign.manual,
            endChild: const _Step(
                title: 'Tiến hành báo giá rèm chi tiết và đặt cọc:',
                desc:
                    'Xác nhận lại mẫu rèm khách chọn ( màu, số đo,...) để báo giá chính xác giá của sản phẩm'),
          ),
        ),
        ResponsiveRowColumnItem(
          child: TimelineTile(
            lineXY: 0.1,
            isLast: true,
            beforeLineStyle: const LineStyle(thickness: 2, color: Colors.blue),
            indicatorStyle: IndicatorStyle(
                width: 20.r,
                indicatorXY: 0.3,
                height: 20.r,
                color: Colors.blue,
                drawGap: true,
                indicator: const _Indicator(
                  number: '4',
                )),
            alignment: TimelineAlign.manual,
            endChild: const _Step(
              title: 'Thi công, lắp đặt rèm cửa tại nhà cho khách hàng:',
              desc:
                  'Nếu khách hàng chấp nhận báo giá và đặt cọc, Tân Hoàng Thạch sẽ tiến hành may và điều nhân viên đến lắp đặt trong khoảng từ 5-7 ngày',
            ),
          ),
        ),
      ],
    ));
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({Key? key, required this.number}) : super(key: key);

  final String number;

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
            // style: TextStyle(fontSize: context.isPhone ? 12.sp : 5.sp),
            style: GoogleFonts.lobster(
              color: Colors.blue,
              fontSize: context.isPhone ? 15.sp : 3.sp,
            )),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({Key? key, required this.title, required this.desc})
      : super(key: key);

  final String title;
  final String desc;

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
                    fontSize: context.isPhone ? 18.sp : 4.sp,
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
                    fontSize: context.isPhone ? 14.sp : 4.sp,
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
