import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' hide Icon;

class FooterDesktop extends StatelessWidget {
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
                    Text(
                      'THÔNG TIN LIÊN HỆ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 5.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Xưởng may: Thôn 1, xã Đức Nhuận, huyện Mộ Đức, tỉnh Quảng Ngãi',
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Chi nhánh: 31 đường số 8, Phường Tăng Nhơn Phú A, Thành phố Thủ Đức, Thành phố Hồ Chí Minh',
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Email: tanhoangthach1202@gmail.com',
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Hotline: 0369391202 (Mr. Nhất)',
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(30.2669444, -97.7427778);

      final mapOptions = new MapOptions()
        ..zoom = 8
        ..center = new LatLng(30.2669444, -97.7427778);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
