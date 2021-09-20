import 'package:fetch_data_fromapi_withgetx/components/colors.dart';
import 'package:fetch_data_fromapi_withgetx/components/string.dart';
import 'package:fetch_data_fromapi_withgetx/productmodule/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(() {
        if (productController.isLoading.value)
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.red,
              strokeWidth: 4,
            ),
          );
        else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.0,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productController.productList[index].imageLink,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productController.productList[index].name),
                            Text(
                              'Brand: ${productController.productList[index].brand}'
                              '\nCategory: ${productController.productList[index].category}'
                              '\nPrice: ${productController.productList[index].price} USD '
                              '\nRating: ${productController.productList[index].rating ?? 'NA'}',
                              style: TextStyle(color: AppColors.gray),
                            ),
                          ],
                        ))
                      ],
                    ),
                    Container(
                      color: AppColors.red,
                      height: 1,
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
