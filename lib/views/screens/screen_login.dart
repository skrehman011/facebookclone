import 'package:facebookclone/controllers/registration_controller.dart';
import 'package:facebookclone/views/screens/screen_sign_up.dart';
import 'package:facebookclone/views/layouts/screen_account_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {

  RegistrationController controller =Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(image: AssetImage('assets/images/face.jpg')),
                Positioned(
                  top: 100,
                  child: Image(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/images/facebook-logo.png'),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 50, bottom: 10),
              child: Column(
                children: [
                  TextField(
                    controller:  controller.emailController,
                    decoration: InputDecoration(
                        hintText: 'Email/Phone Number',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.5))),
                  ),
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                    ),
                  ).marginOnly(top: 15, bottom: 40),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        controller.Login();
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ).marginOnly(top: 5, bottom: 30),
                  Stack(children: [
                    Center(
                        child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    )),
                    Center(child: Text('OR'))
                  ]).marginOnly(bottom: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                        child: TextButton(
                      onPressed: () {
                        Get.to(ScreenSignUp());
                      },
                        child: Text('Create New Facebook Account',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
