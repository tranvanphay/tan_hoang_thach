import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/routes.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class ProductMobile extends StatefulWidget {
  const ProductMobile({Key? key}) : super(key: key);

  @override
  State<ProductMobile> createState() => _ProductMobileState();
}

class _ProductMobileState extends State<ProductMobile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: _readJson(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Center(
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
                ),
                Text(
                  'Sản phẩm',
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: context.isPhone ? 25.sp : 7.sp),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.isPhone ? 5.h : 15.h,
                    horizontal: 50.w,
                  ),
                ),
                StaggeredGridView.countBuilder(
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
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  Future<List<Product>> _readJson() async {
    final String response = await rootBundle.loadString('assets/product.json');
    List<dynamic> data = jsonDecode(response);
    return List<Product>.from(
        data.map<Product>((dynamic i) => Product.fromJson(i)));
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
                height: 270.h,
                child: Image.asset(_getImage(product)),
              ),
              SizedBox(
                height: 80.h,
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
                              fontSize: 18.sp,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            'Giá gốc: ${product.stockPrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: AppColor.textGrey,
                            ),
                          ),
                          Text(
                            'Giá mới: ${product.salePrice}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp,
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
        Navigator.pushNamed(context, Routes.productDetailMob,
            arguments: product);
      },
    );
  }

  String _getImage(Product product) {
    return 'assets/${product.type}/${product.images![0]}';
  }
}
