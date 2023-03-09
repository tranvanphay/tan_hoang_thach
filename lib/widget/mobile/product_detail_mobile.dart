import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tan_hoang_thach/model/product.dart';
import 'package:tan_hoang_thach/utils/colors.dart';

class ProductDetailMobile extends StatefulWidget {
  final Product product;
  ProductDetailMobile({Key? key, required this.product});

  @override
  State<ProductDetailMobile> createState() => _ProductDetailMobileState();
}

class _ProductDetailMobileState extends State<ProductDetailMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBg,
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
                  child: Column(
                    children: [
                      _photoView(widget.product),
                      _info(widget.product)
                    ],
                  ),
                ),
              )
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
              fontSize: 25.sp,
              color: AppColor.textBlue,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Đã bán: ${product.sold}',
          style: TextStyle(fontSize: 12.sp),
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
                  fontSize: 15.sp,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '${product.salePrice}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.sp,
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
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
                'Miễn phí vận chuyển và lắp ráp',
                style: TextStyle(fontSize: 15.sp),
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
            ),
            Expanded(
              child: Text(
                product.unit ?? '',
                style: TextStyle(fontSize: 15.sp),
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
            ),
            Expanded(
              child: Text(
                product.guarantee ?? '',
                style: TextStyle(fontSize: 15.sp),
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
            ),
            Expanded(
              child: Text(
                'Liên hệ để được tư vấn và xem hình ảnh thực tế',
                style: TextStyle(fontSize: 15.sp),
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
            ),
            Expanded(
              child: Text(
                product.material ?? '',
                style: TextStyle(fontSize: 15.sp),
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
              style: TextStyle(color: AppColor.textGrey, fontSize: 15.sp),
            ),
            Expanded(
              child: Text(
                product.isOutOfStock == true ? "Hết hàng" : "Còn hàng",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
          ],
        )
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
          width: 250.r,
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
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
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12.sp),
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
        width: 64.r,
        height: 64.r,
        fit: BoxFit.contain,
      ),
    );
  }

  void _showDialogPhoto(String url) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
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
}
