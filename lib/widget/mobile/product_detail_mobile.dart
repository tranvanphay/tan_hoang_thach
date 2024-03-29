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
import 'package:tan_hoang_thach/utils/images.dart';
import 'package:tan_hoang_thach/utils/mobile_font_size.dart';
import 'package:tan_hoang_thach/widget/floating_action_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/strings.dart';

class ProductDetailMobile extends StatefulWidget {
  String productId;
  ProductDetailMobile({super.key, required this.productId});

  @override
  State<ProductDetailMobile> createState() => _ProductDetailMobileState();
}

class _ProductDetailMobileState extends State<ProductDetailMobile> {
  final ScrollController _controller = ScrollController();
  Product? _product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future(() => true);
      },
      child: Scaffold(
        backgroundColor: AppColor.appBg,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingAction(
          isPhone: context.isPhone,
        ),
        body: FutureBuilder<Product>(
            future: _getProductById(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _product = snapshot.data;
                return SingleChildScrollView(
                    controller: _controller,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
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
                            child: Column(
                              children: [_photoView(_product), _info(_product)],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          AppString.productRef,
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: MobileFontSize.textHeader3),
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
              } else if (snapshot.hasError) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      _launchUrl(AppString.rootAddress);
                    },
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image.asset(
                          AppImage.appIcon,
                          width: 100.w,
                        )),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget _info(Product? product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          product?.name ?? '',
          style: TextStyle(
              fontSize: MobileFontSize.textHeader3,
              color: AppColor.textBlue,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          '${AppString.daBan}${product?.sold}',
          style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
                  fontSize: MobileFontSize.textSizeBig,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '${product?.salePrice}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: MobileFontSize.textHeader3,
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
              AppString.vanChuyen,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            const Icon(
              Icons.delivery_dining_outlined,
              color: Colors.blue,
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                AppString.mienPhiVanChuyen,
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
              AppString.donVi,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            Expanded(
              child: Text(
                product?.unit ?? '',
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
              AppString.baoHanh,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            Expanded(
              child: Text(
                product?.guarantee ?? '',
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
              AppString.mauSac,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            Expanded(
              child: Text(
                AppString.lienHe,
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
              AppString.chatLieu,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            Expanded(
              child: Text(
                product?.material ?? '',
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
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
              AppString.tinhTrang,
              style: TextStyle(
                  color: AppColor.textGrey,
                  fontSize: MobileFontSize.textSizeBig),
            ),
            Expanded(
              child: Text(
                product?.isOutOfStock == true
                    ? AppString.hetHang
                    : AppString.conHang,
                style: TextStyle(fontSize: MobileFontSize.textSizeBig),
              ),
            ),
          ],
        )
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
              height: 350.h,
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
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
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
          AppString.nhanVaoDeXemAnhPhongTo,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: MobileFontSize.textSizeSmall),
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
        width: 80.w,
        height: 80.w,
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
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
          height: 350.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
                child: Image.asset(_getImage(product)),
              ),
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.only(right: 3.w),
                          child: Text(
                            product.isOutOfStock == true
                                ? AppString.outOfStock
                                : AppString.stocking,
                            style: TextStyle(
                                fontSize: MobileFontSize.textSizeSmall,
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
                              fontSize: MobileFontSize.textSizeNormal,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            '${AppString.stockPrices}${product.stockPrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w700,
                              fontSize: MobileFontSize.textSizeSmall,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            '${AppString.newPrices}${product.salePrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: MobileFontSize.textSizeNormal,
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
        Navigator.pushNamed(
            context, "${Routes.productDetailMob}?type=${product.type}");
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
