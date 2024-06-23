import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/view/components/app_scaffold.dart';

import '../../../core/base/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              controller.repositories.isEmpty
                  ? const SizedBox.shrink()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.repositories.length,
                      itemBuilder: (context, index) {
                        final repo = controller.repositories[index];
                        return ListTile(
                          title: Text(repo.name ?? ''),
                          subtitle: Text(repo.description ?? ''),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
