import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchResultView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchResultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
