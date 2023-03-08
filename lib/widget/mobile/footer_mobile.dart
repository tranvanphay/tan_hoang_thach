import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

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
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'THÔNG TIN LIÊN HỆ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'Xưởng may: Thôn 1, xã Đức Nhuận, huyện Mộ Đức, tỉnh Quảng Ngãi',
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Chi nhánh: 31 đường số 8, Phường Tăng Nhơn Phú A, Thành phố Thủ Đức, Thành phố Hồ Chí Minh',
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Email: tanhoangthach1202@gmail.com',
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Hotline: 0369391202 (Mr. Nhất)',
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
