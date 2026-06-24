import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body:    Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: controller.usernameController,
            decoration: const InputDecoration(labelText: "Username"),),
            const SizedBox(height: 15),
            TextField(controller: controller.passwordController, obscureText: false,
            decoration: const InputDecoration(labelText: "Password"),),
            const SizedBox(height: 25),
            Obx(()
              => ElevatedButton(onPressed: controller.isLoading.value? null 
              :()=>controller.login(), 
              child:controller.isLoading.value? const CircularProgressIndicator():
               const Text("LOGIN")),
            ),
             
          ],
        ),
      ),
    );
  }
}


// Username: mor_2314
// Password: 83r5^_