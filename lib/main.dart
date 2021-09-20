import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/components.dart';
import 'productmodule/views/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.fetchApiData,
      theme: ThemeData(primaryColor: AppColors.red),
      home: ProductListView(),
    );
  }
}
