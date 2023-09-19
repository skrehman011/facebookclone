import 'dart:io';

import 'package:facebookclone/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPost extends StatelessWidget {
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      postController.pickImage();
                    },
                    icon: Icon(Icons.image)),
                IconButton(
                    onPressed: () {
                      postController.pickVideo();
                    },
                    icon: Icon(Icons.video_camera_back)),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Obx(() {
                return Image(
                    height: Get.height * .4,
                    width: Get.width,
                    image: (postController.imagePath.value.isEmpty)
                        ? AssetImage("assets/images/multan.jpg")
                        : FileImage(
                                File(postController.imagePath.value.toString()))
                            as ImageProvider);
              }),
            ).marginOnly(bottom: 10),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: postController.postDescription,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter your Post'),
              ),
            ),
            ElevatedButton(onPressed: () async {
              var response = await postController.addPost();
              if (response == "success") {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Post Added")));
                Get.back();
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(response.toString())));
              }
            }, child: Obx(() {
              return (postController.uploadPost.value)
                  ? CircularProgressIndicator()
                  : Text("create Post");
            }))
          ],
        ),
      ),
    );
  }
}
