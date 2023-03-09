import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

import '../floating_action_button.dart';

class ProductDetailDesktop extends StatefulWidget {
  Product product;
  ProductDetailDesktop({Key? key, required this.product});

  @override
  State<ProductDetailDesktop> createState() => _ProductDetailDesktopState();
}

class _ProductDetailDesktopState extends State<ProductDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBg,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingAction(),
      body: SingleChildScrollView(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: _photoView(widget.product)),
                      Expanded(flex: 2, child: _info(widget.product))
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
                    fontSize: context.isPhone ? 25.sp : 7.sp),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  child: _relatedProducts(widget.product.type),
                ),
              ),
            ],
          )),
    );
  }

  Widget _info(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          product.name ?? '',
          style: TextStyle(
              fontSize: 7.sp,
              color: AppColor.textBlue,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Đã bán: ${product.sold}',
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
              '${product.stockPrice}',
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: 5.sp,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '${product.salePrice}',
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
                product.unit ?? '',
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
                product.guarantee ?? '',
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
                product.material ?? '',
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
                product.isOutOfStock == true ? "Hết hàng" : "Còn hàng",
                style: TextStyle(fontSize: 5.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _photoView(Product product) {
    return Column(
      children: [
        CarouselSlider(
            items: product.images!
                .map((image) => Image.asset(
                      'assets/${product.type}/$image',
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
            itemCount: product.images!.length,
            itemBuilder: (buildContext, index) {
              return _itemAssets(product.images![index], product.type!);
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

  Widget _itemAssets(String assets, String type) {
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
                                ? '(Hết hàng) '
                                : '(Còn hàng) ',
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
                            'Giá gốc: ${product.stockPrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w700,
                              fontSize: (3.5).sp,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            'Giá mới: ${product.salePrice}',
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
        widget.product = product;
        setState(() {});
      },
    );
  }

  Future<List<Product>> _getListRelated(String? type) async {
    final listProduct = await _readJson();
    listProduct.removeWhere((element) => element.type == type);
    return listProduct;
  }

  Future<List<Product>> _readJson() async {
    final String response = await rootBundle.loadString('assets/product.json');
    List<dynamic> data = jsonDecode(response);
    return List<Product>.from(
        data.map<Product>((dynamic i) => Product.fromJson(i)));
  }

  String _getImage(Product product) {
    return 'assets/${product.type}/${product.images![0]}';
  }
}
