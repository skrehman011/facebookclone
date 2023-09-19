import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookclone/views/screens/screen_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/student_model.dart';

class RegistrationController extends GetxController {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void SignUp() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String age = ageController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || age.isEmpty || email.isEmpty ||
        password.isEmpty) {
      Get.snackbar('Alert', 'Filled all Fields');
    } else {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password).then((value) {
        Get.snackbar('Success', 'User Register Successfully');
        emailController.clear();
        firstNameController.clear();
        lastNameController.clear();
        passwordController.clear();
        ageController.clear();

        Student user = Student(
            id: value.user!.uid,
            email: email,
            password: password,
            age: int.tryParse(age) ?? 0,
             firstName: firstName,
            lastName: lastName,
        );

         FirebaseAuth.instance.currentUser!.updateDisplayName(firstName);
        // currentUser!.updateDisplayName(name);

        FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .set(user.toMap())
            .then((value) {
          Get.snackbar('Alert', 'Successfully Data Stored');
        });
        Get.offAll(ScreenHome());

        // print(value.user!.email.toString());
      }).catchError((error) {
        Get.snackbar('Error', error.toString());
      });
    }
  }

  void Login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Alert', 'Fill all the field');
    } else {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.snackbar('Success', 'Login SuccessFully');
        emailController.clear();
        passwordController.clear();

        var myDoc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
        var obj = Student.fromMap(myDoc.data()!);
        FirebaseAuth.instance.currentUser!.updateDisplayName(obj.firstName);

         Get.offAll(ScreenHome());
        print(value.user!.email.toString());
      }).catchError((error) {
        Get.snackbar('error', error.toString());
      });
    }
  }

}