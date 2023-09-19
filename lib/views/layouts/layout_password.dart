import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/registration_controller.dart';

class LayoutPassword extends StatelessWidget {

  RegistrationController controller =Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        leading: IconButton(

          icon: Icon (Icons.arrow_back),
          color: Colors.black, onPressed: () {
          Get.back();
        },
        ),
        title: Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Text("What's your Password?", style: TextStyle(
                fontSize:16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),).marginOnly(bottom: 40, top: 60),

              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                ),
              ).marginOnly(bottom: 90),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.SignUp();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
