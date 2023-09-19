import 'package:facebookclone/views/screens/screen_sign_up.dart';
import 'package:facebookclone/views/screens/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/registration_controller.dart';

class ScreenName extends StatelessWidget {

  RegistrationController controller =Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Text("What's your Name?", style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),).marginOnly(bottom: 40, top: 60),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width *0.4,
                            child: TextField(
                              controller:  controller.firstNameController,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                              ),
                            )).marginOnly(right: 15),
                        Container(
                            width: MediaQuery.of(context).size.width *0.4,
                            child: TextField(
                              controller: controller.lastNameController,
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                              ),
                            )),
                      ],
                    )
                  ).marginOnly(bottom: 90),

                // Container(
                //   height: 40,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     color: Colors.blueAccent,
                //   ),
                //   child: TextButton(
                //     onPressed: () {
                //        Get.to(StepperPage());
                //     },
                //     child: Text(
                //       'Next',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 18,
                //       ),
                //     ),
                //   ),
                // ),
            ],
          ),
                ),
              )),
        ],
      ),
    );
  }
}
