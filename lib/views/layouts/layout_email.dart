import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/registration_controller.dart';

class LayoutEmail extends StatelessWidget {

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
          'Email',
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
              Text("What's your Email?", style: TextStyle(
                fontSize:16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),).marginOnly(bottom: 40, top: 60),

              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
