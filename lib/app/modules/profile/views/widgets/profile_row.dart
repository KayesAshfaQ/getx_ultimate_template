import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/values/const/font_family.dart';

class ProfileRow extends StatelessWidget {
  final String icon, title, count;
  final bool hasCount, hasIcon, hasDivider;
  final double top;
  final void Function()? onTap;
  final Color? boxColor, countColor, imgColor;

  const ProfileRow({
    super.key,
    this.icon = "assets/icons/manage_order.svg",
    this.title = "",
    this.boxColor,
    this.imgColor,
    this.countColor,
    this.count = "",
    this.onTap,
    this.top = 11.0,
    this.hasCount = true,
    this.hasIcon = true,
    this.hasDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              hasIcon
                  ? Expanded(
                      flex: 2,
                      child: SvgPicture.asset(
                        icon,
                        alignment: Alignment.center,
                        matchTextDirection: true,
                        height: 18.h,
                        width: 18.h,
                        color: hasDivider ? const Color.fromRGBO(102, 102, 102, 1) : Colors.red,
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                flex: 15,
                child: Padding(
                  padding: REdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          softWrap: true,
                          // textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: hasDivider ? const Color.fromRGBO(102, 102, 102, 1) : Colors.red,
                            fontFamily: FontFamily.inter,
                          ),
                        ),
                      ),
                      // const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 3, top: 4).r,
                        margin: EdgeInsets.only(bottom: 11, top: top, right: 10).r,
                        decoration: BoxDecoration(
                            color: hasCount != true ? null : boxColor,
                            borderRadius: BorderRadius.circular(3).r),
                        child: Text(
                          hasCount != true ? " " : count,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'imedium',
                            color: hasCount != true ? null : countColor,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          hasDivider ? Divider(height: 0.h) : const SizedBox(),
        ],
      ),
    );
  }
}
