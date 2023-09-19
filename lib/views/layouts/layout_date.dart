import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/registration_controller.dart';




class LayoutDate extends StatelessWidget {

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
          'BirthDay',
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("What's your BirthDay?", style: TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),).marginOnly(bottom: 40, top: 60),
                        Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: TextField(
                              controller: controller.ageController,
                              decoration: InputDecoration(
                                hintText: 'Enter Age',
                              ),
                            ),
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
                ),
              )),
        ],
      ),
    );
  }
}
