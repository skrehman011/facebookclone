import 'package:facebookclone/views/layouts/layout_date.dart';
import 'package:facebookclone/views/layouts/layout_email.dart';
import 'package:facebookclone/views/layouts/layout_password.dart';
import 'package:facebookclone/views/screens/screen_login.dart';
import 'package:facebookclone/views/layouts/screen_name.dart';
import 'package:facebookclone/views/layouts/screen_account_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ScreenSignUp extends StatefulWidget {
  @override
  _ScreenSignUpState createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  final List<Widget> pages = [
    ScreenAccountCreate(),
    ScreenName(),
    LayoutDate(),
    LayoutEmail(),
    LayoutPassword(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: pages.length,
              controller: _pageController, // Use the PageController here
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (currentPage < pages.length - 1)
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueAccent,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Next',
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
          Center(
              child: TextButton(
                onPressed: () {
                  Get.to(ScreenLogin());
                },
                child: Text('Already have an Account',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent)),
              )).paddingOnly(bottom: 10)
        ],
      ),
    );
  }
}
