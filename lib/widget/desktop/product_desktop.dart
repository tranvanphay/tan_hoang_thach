import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/routes.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class ProductDesktop extends StatefulWidget {
  const ProductDesktop({Key? key}) : super(key: key);

  @override
  State<ProductDesktop> createState() => _ProductDesktopState();
}

class _ProductDesktopState extends State<ProductDesktop> {
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sản phẩm',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: context.isPhone ? 25.sp : 7.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.isPhone ? 5.h : 15.h,
                    horizontal: 50.w,
                  ),
                ),
                StaggeredGridView.countBuilder(
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
        Navigator.pushNamed(
            context, "${Routes.productDetail}?type=${product.type}");
      },
    );
  }

  String _getImage(Product product) {
    return 'assets/${product.type}/${product.images![0]}';
  }
}
