import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookclone/helpers/firebase_utils.dart';
import 'package:facebookclone/models/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/firebase_helpers.dart';

class PostController extends GetxController {
  RxString imagePath = "".obs;
  RxBool  uploadPost=false.obs;
  RxString videoPath = "".obs;
  RxString mediaUrl = "".obs;
  RxString postType = "Image".obs;

  TextEditingController postDescription = TextEditingController();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    imagePath.value = pickedImage!.path;
  }

  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    videoPath.value = pickedVideo!.path;
    // if (pickedVideo != null) {
    //   _videoController = VideoPlayerController.file(File(pickedVideo.path))
    //     ..initialize().then((_) {
    //     });
  }

  Future<String> addPost() async {
    String response = "";
    String userId=FirebaseAuth.instance.currentUser!.uid;
    String description = postDescription.text.trim();
    if (description.isNotEmpty) {
      uploadPost.value=true;
      if(imagePath.isNotEmpty){
        postType.value="image";
         mediaUrl.value= await FirebaseUtils.uploadSingleImage(imagePath.value, "Post/${FirebaseUtils.myId}/${postType.value}/${imagePath.value}").catchError((error){
           response=error.toString();
           uploadPost.value=false;
         });
      }
      else{
        postType.value="video";
        mediaUrl.value= await FirebaseUtils.uploadSingleImage(videoPath.value, "Post/${FirebaseUtils.myId}/${postType.value}/${videoPath.value}").catchError((error){

          uploadPost.value=false;
          response=error.toString();
        });

      }

      int timeStamp=DateTime.now().millisecondsSinceEpoch;
      Post post = Post(
        id: timeStamp.toString(),
        userId: userId,
        description: description,
        mediaUrl: mediaUrl.value,
        type: postType.value,
        timeStamp: timeStamp,
      );
    await  FirebaseFirestore.instance.collection("Posts").doc(post.id).set(post.toMap()).then((value) {
        response="success";
        uploadPost.value=false;
      }).catchError((error){
       response=error.toString();
        uploadPost.value=false;
      });
    }
    else {
      response = "Description required";
    }

    return response;
  }
}
