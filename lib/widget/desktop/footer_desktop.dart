import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tan_hoang_thach/utils/strings.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({Key? key}) : super(key: key);

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
                      AppString.contactInfo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 5.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppString.address1,
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppString.address2,
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppString.email,
                      style: TextStyle(fontSize: 3.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppString.phoneNumber,
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
}
