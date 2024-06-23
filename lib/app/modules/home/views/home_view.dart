import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view/components/app_scaffold.dart';
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
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: ListTile(
                            title: Text(repo.name ?? ''),
                            subtitle: Text(
                              repo.description ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
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
