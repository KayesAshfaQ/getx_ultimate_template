import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_image_view.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  String asset;
  String bannerName;
  // PopularCategoriesData itemWidgetList;
  //CustomChanelItem item;
  ItemWidget(this.asset, this.bannerName, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // return Align(
    //   alignment: Alignment.bottomCenter,
    //   child:
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsets.all(1),
        //color: Colors.red,
        // height: 120.h,
        width: 55.w,
        child: Column(
          children: [
            AppImageView(
              "assets/temp/item.png",
              height: 56.w,
              width: 56.w,
              fit: BoxFit.cover,
              isImageCircular: true,
              // border: Border.all(color: MyTheme.gray200),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color.fromRGBO(0, 0, 0, 0.08),
              //     blurRadius: 1,
              //     offset: Offset(0, 0.5),
              //   ),
              // ],
            ),
            SizedBox(height: 2.h),
            SizedBox(
              //height: 20.h,
              width: 45.w,
              child: const Text(
                  //bannerName
                  " hello hello mike testing",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
