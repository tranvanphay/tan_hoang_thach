import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/routes.dart';
import 'package:tan_hoang_thach/utils/colors.dart';
import 'package:tan_hoang_thach/utils/files.dart';
import 'package:tan_hoang_thach/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../floating_action_button.dart';

class ProductDetailDesktop extends StatefulWidget {
  String productId;
  ProductDetailDesktop({super.key, required this.productId});

  @override
  State<ProductDetailDesktop> createState() => _ProductDetailDesktopState();
}

class _ProductDetailDesktopState extends State<ProductDetailDesktop> {
  final ScrollController _controller = ScrollController();
  Product? _product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBg,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingAction(
          isPhone: context.isPhone,
        ),
        body: FutureBuilder<Product>(
          future: _getProductById(),
          builder: (context, snapshoot) {
            if (snapshoot.hasData) {
              _product = snapshoot.data;
              return SingleChildScrollView(
                  controller: _controller,
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 10.r),
                          child: Row(
                            children: [
                              Expanded(flex: 3, child: _photoView(_product)),
                              Expanded(flex: 2, child: _info(_product))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Sản phẩm liên quan',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 7.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 10.r),
                          child: _relatedProducts(_product?.type),
                        ),
                      ),
                    ],
                  ));
            } else if (snapshoot.hasError) {
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget _info(Product? product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          product?.name ?? '',
          style: TextStyle(
              fontSize: 7.sp,
              color: AppColor.textBlue,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Đã bán: ${product?.sold}',
          style: TextStyle(fontSize: 5.sp),
        ),
        Divider(
          color: AppColor.textBlue,
          thickness: 1.5,
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${product?.stockPrice}',
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: 5.sp,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '${product?.salePrice}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vận chuyển: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Icon(
              Icons.delivery_dining_outlined,
              color: Colors.blue,
              size: 30.r,
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                'Miễn phí vận chuyển và lắp ráp',
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đơn vị: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Expanded(
              child: Text(
                product?.unit ?? '',
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bảo hành: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Expanded(
              child: Text(
                product?.guarantee ?? '',
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Màu sắc: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Expanded(
              child: Text(
                'Liên hệ để được tư vấn và xem hình ảnh thực tế',
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chất liệu: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Expanded(
              child: Text(
                product?.material ?? '',
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tình trạng: ',
              style: TextStyle(color: AppColor.textGrey, fontSize: 5.sp),
            ),
            Expanded(
              child: Text(
                product?.isOutOfStock == true ? "Hết hàng" : "Còn hàng",
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _photoView(Product? product) {
    return Column(
      children: [
        CarouselSlider(
            items: (product?.images ?? [])
                .map((image) => Image.asset(
                      'assets/${product?.type}/$image',
                      width: double.infinity,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 300.h,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          width: 300.r,
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product?.images?.length,
            itemBuilder: (buildContext, index) {
              return _itemAssets(product?.images?[index], product?.type);
            },
            staggeredTileBuilder: (int index) {
              return const StaggeredTile.fit(1);
            },
            mainAxisSpacing: 6.r,
          ),
        ),
        Text(
          "(Nhấn vào ảnh để phóng to)",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 3.sp),
        )
      ],
    );
  }

  Widget _itemAssets(String? assets, String? type) {
    return InkWell(
      onTap: () {
        _showDialogPhoto('assets/$type/$assets');
      },
      child: Image.asset(
        'assets/$type/$assets',
        width: 50.r,
        height: 50.r,
        fit: BoxFit.contain,
      ),
    );
  }

  void _showDialogPhoto(String url) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            content: Image.asset(url),
          );
        });
  }

  Widget _relatedProducts(String? type) {
    return FutureBuilder<List<Product>>(
        future: _getListRelated(type),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (buildContext, index) {
                if (snapshot.data != null) {
                  Product product = snapshot.data![index];
                  return _buildGridItem(product);
                } else {
                  return Container();
                }
              },
              staggeredTileBuilder: (int index) {
                return const StaggeredTile.fit(1);
              },
              mainAxisSpacing: 6.w,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  Widget _buildGridItem(Product product) {
    return InkWell(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 280.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.h,
                child: Image.asset(_getImage(product)),
              ),
              SizedBox(
                height: 80.h,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: Text(
                            product.isOutOfStock == true
                                ? AppString.outOfStock
                                : AppString.stocking,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: product.isOutOfStock == true
                                    ? Colors.redAccent
                                    : null),
                          ),
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 4.sp,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            '${AppString.stockPrices}${product.stockPrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w700,
                              fontSize: (3.5).sp,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            '${AppString.newPrices}${product.salePrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 4.sp,
                              color: AppColor.textBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(
            context, '${Routes.productDetail}?type=${product.type}');
      },
    );
  }

  Future<List<Product>> _getListRelated(String? type) async {
    final listProduct = await _readJson();
    listProduct.removeWhere((element) => element.type == type);
    return listProduct;
  }

  Future<List<Product>> _readJson() async {
    final String response = await rootBundle.loadString(AppFiles.jsonProduct);
    List<dynamic> data = jsonDecode(response);
    return List<Product>.from(
        data.map<Product>((dynamic i) => Product.fromJson(i)));
  }

  String _getImage(Product product) {
    return 'assets/${product.type}/${product.images![0]}';
  }

  Future<Product> _getProductById() async {
    final listData = await _readJson();
    return listData.where((element) => element.type == widget.productId).first;
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
