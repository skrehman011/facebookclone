import 'package:facebookclone/views/screens/screen_login.dart';
import 'package:facebookclone/views/layouts/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAccountCreate extends StatelessWidget {
  const ScreenAccountCreate({Key? key}) : super(key: key);

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
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20, ),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/Meta.png')),
                  Text('Join Facebook', style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),).marginOnly(bottom: 10, top: 40),
                  Text("We'll help you create a new account in few \n                             easy steps", style: TextStyle(
                    fontSize:14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),).paddingOnly(right :5, left: 5, ),
                  // Container(
                  //   height: 40,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     color: Colors.blueAccent,
                  //   ),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Get.to(ScreenName());
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
            // Center(
            //     child: TextButton(
            //   onPressed: () {
            //     Get.to(ScreenLogin());
            //   },
            //      child: Text('Already have an Account',
            //       style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.blueAccent)),
            // ))
          ],
        ),
      ),
    );
  }
}
