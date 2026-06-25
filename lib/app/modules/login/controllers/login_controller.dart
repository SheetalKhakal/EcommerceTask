import 'package:ecommerce/app/constants/api_constant.dart';
import 'package:ecommerce/app/services/api_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final ApiService apiService = ApiService();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

   Future<void> login()async{
    try {
      isLoading.value = true;
     final response =  await apiService.post(ApiConstants.login, 
      {"username":usernameController.text.trim(), 
      "password":passwordController.text.trim()});
        print("Login Response: $response");
      Get.offAllNamed(Routes.PRODUCT);
    } catch (e) {
      Get.snackbar("Error", "Login Failed: ${e.toString()}");
    }finally{
      isLoading.value = false;
    }
   }
}
