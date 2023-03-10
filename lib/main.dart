import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tan_hoang_thach/home.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/routes.dart';
import 'package:tan_hoang_thach/widget/desktop/product_detail_desktop.dart';
import 'package:tan_hoang_thach/widget/mobile/product_detail_mobile.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Tân Hoàng Thạch',
          theme: ThemeData(fontFamily: 'Barlow'),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            child = ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child),
                maxWidth: 2460,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
                background: Container(color: Colors.white));

            return child;
          },
          initialRoute: Routes.home,
          onGenerateRoute: (RouteSettings settings) {
            return Routes.fadeThrough(settings, (context) {
              if (settings.name == Routes.home) {
                return const HomePage();
              } else if ((settings.name ?? '')
                  .contains(Routes.productDetailMob)) {
                return ProductDetailMobile(
                    productId: _getParms(settings.name ?? ''));
              } else if ((settings.name ?? '').contains(Routes.productDetail)) {
                return ProductDetailDesktop(
                    productId: _getParms(settings.name ?? ''));
              } else {
                return Center(
                  child: InkWell(
                    onTap: () {
                      _launchUrl('https://tanhoangthach-curtain.web.app/');
                    },
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 100.w,
                        )),
                  ),
                );
              }
            });
          },
        );
      },
    );
  }

  String _getParms(String route) {
    return route.split("=")[1];
  }

  _launchUrl(String url) async {
    EasyLoading.show();
    final uri = Uri.parse(
      url,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
              mode: LaunchMode.platformDefault, webOnlyWindowName: '_self')
          .then((value) {
        EasyLoading.dismiss();
      });
    } else {
      EasyLoading.dismiss();
      throw 'Could not launch $url';
    }
  }
}
