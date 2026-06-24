import 'package:ecommerce/app/constants/api_constant.dart';
import 'package:ecommerce/app/modules/product/models/product_model.dart';
import 'package:ecommerce/app/services/api_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ApiService apiService = ApiService();

  RxBool isLoading = false.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

 
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  
Future<void> fetchProducts() async{
  try {
    isLoading.value = true;
    final response = await apiService.get(ApiConstants.products);
    products.value = (response as List).map((e) => 
                      ProductModel.fromJson(e)).toList();
  } finally{
    isLoading.value=false;
  }
}
}