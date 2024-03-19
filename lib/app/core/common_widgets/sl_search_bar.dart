import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

class SlSearchBar extends StatelessWidget {
  const SlSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(Routes.search);
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 0),
          // width: Get.width - 32.w,
          // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          height: 40.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              // border: Border.all(color: Colors.red, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.08),
                  spreadRadius: 0.01,
                  blurRadius: 0.01,
                ),
              ],
            ),
            child: TextField(
              onTap: () {},
              enabled: false,
              decoration: InputDecoration(
                isDense: true,
                // important line
                contentPadding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                // control your hints text size
                border: InputBorder.none,
                fillColor: const Color.fromRGBO(241, 241, 241, 1),
                filled: true,
                hintText: "home_screen_search".tr,
                hintStyle: const TextStyle(
                    fontFamily: 'iregular',
                    color: Color.fromRGBO(99, 99, 99, 1),
                    fontSize: 14),
                // suffixIconColor: Colors.grey,
                prefixIcon: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 14.h,
                    width: 14.h,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
