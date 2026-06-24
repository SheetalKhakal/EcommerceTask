import 'package:ecommerce/app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isLoading.value = true){
          return const Center(child: CircularProgressIndicator(),);
        }

        return ListView.builder(itemCount: controller.products.length,
        itemBuilder: (context,index){
          final product = controller.products[index];
          return ProductCard(title: product.title, price: product.price, image: product.image);
        });
      })
    );
  }
}
