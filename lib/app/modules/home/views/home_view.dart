import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Strings.home.tr),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ----------------- image banner -----------------
        const SliverToBoxAdapter(
          child: ColoredBox(
            color: Colors.yellow,
            child: SizedBox(
              height: 200,
              child: Center(
                child: Text('Banner'),
              ),
            ),
          ),
        ),

        // text and view all button
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Popular Items'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                ),
              ],
            ),
          ),
        ),

        // ----------------- grid view -----------------
        SliverToBoxAdapter(
          child: SizedBox(
            height: 548.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
                childAspectRatio: 248 / 160, // aspect ratio of each item (width/height)
              ),
              padding: const EdgeInsets.all(8.0), // padding around the grid
              itemCount: 12, // total number of items
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blue, // color of grid items
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text('Item $index'),
                onTap: () {},
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
