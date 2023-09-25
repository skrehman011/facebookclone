import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookclone/controllers/post_controller.dart';
import 'package:facebookclone/models/post.dart';
import 'package:facebookclone/models/student_model.dart';
import 'package:facebookclone/views/screens/screen_login.dart';
import 'package:facebookclone/views/screens/screen_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facebook',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _showBottomSheet(context);
                          //  Get.to(ScreenPost());
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: IconButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signOut()
                                .then((value) => Get.to(ScreenLogin()));
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )),
                  ],
                ),
              )
            ],
          ).marginOnly(top: 10, bottom: 10),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(),
                    Container(
                      // padding: EdgeInsets.only(top: 15, bottom: 0),
                      height: 43,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, bottom: 0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "What's on your mind",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Icon(Icons.insert_photo_outlined),
                  ],
                ),
              ),
            ).marginOnly(top: 5),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Posts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    List<Post> posts = snapshot.data!.docs
                        .map((e) =>
                            Post.fromMap(e.data() as Map<String, dynamic>))
                        .toList();
                    return (posts.isEmpty)
                        ? Center(child: Text("No Post Yet"))
                        : ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (BuildContext context, int index) {
                              var post = posts[index];
                              return Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    // ListTile(
                                    //   leading: CircleAvatar(),
                                    //   title: Text('Name'),
                                    //   subtitle: Text('12:36'),
                                    //   trailing: Icon(Icons.more_horiz),
                                    // )
                                    StreamBuilder<DocumentSnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(post.userId)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return SizedBox(
                                              height: 20,
                                            );
                                          }
                                          var user = Student.fromMap(
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 10,
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    // CircleAvatar(
                                                    //   backgroundImage: NetworkImage(user.age),
                                                    // ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(user.firstName),
                                                        Row(
                                                          children: [
                                                            Text('20h .'),
                                                            Icon(
                                                              Icons
                                                                  .browser_updated,
                                                              size: 20,
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.more_horiz),
                                                    Icon(Icons.delete_forever),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),

                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(post.description),
                                          ],
                                        ),
                                      ),
                                    ).marginOnly(bottom: 10),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Image(
                                          image: NetworkImage(post.mediaUrl)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 5, top: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.heart_broken_sharp),
                                          Text('5')
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25,
                                          bottom: 15,
                                          top: 5,
                                          right: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.gpp_good_outlined),
                                              Text('Like'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.mode_comment),
                                              Text('Comments'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.share),
                                              Text('Share'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ).marginOnly(bottom: 10);
                            },
                          );
                  }),
            ),
          ],
        ));
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Image'),
                onTap: () {
                  _imageBottomSheet(context);
                  // Yahaan pe aap image ke action ko daal sakte hain.
                },
              ),
              ListTile(
                leading: Icon(Icons.video_call),
                title: Text('Video'),
                onTap: () {
                  _videoBottomSheet(context);
                  // Yahaan pe video ke action ko daal sakte hain.
                },
              ),
              ListTile(
                leading: Icon(Icons.text_decrease),
                title: Text('Text'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Close'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _imageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('Camera'),
                onTap: () {
                  // Yahaan pe aap image ke action ko daal sakte hain.
                },
              ),
              ListTile(
                leading: Icon(Icons.browse_gallery),
                title: Text('Gallery'),
                onTap: () {
                 controller.pickImage();
                 Get.to(ScreenPost());
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Close'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _videoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('Camera'),
                onTap: () {
                  // Yahaan pe aap image ke action ko daal sakte hain.
                },
              ),
              ListTile(
                leading: Icon(Icons.browse_gallery),
                title: Text('Gallery'),
                onTap: () {
                  // Yahaan pe video ke action ko daal sakte hain.
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Close'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  }
