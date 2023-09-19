import 'package:facebookclone/views/screens/screen_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

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
           Text('Facebook', style: TextStyle(
             fontWeight: FontWeight.w900,
             fontSize: 25,
             color: Colors.blueAccent,
           ),),
           Container(
             width: MediaQuery.of(context).size.width*0.42,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(

                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.grey.withOpacity(0.3),
                     ),
                     child: IconButton(icon: Icon(Icons.add, color: Colors.black,), onPressed: () { Get.to(ScreenPost()); },)),
                 Container(

                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.grey.withOpacity(0.3),
                     ),
                     child: IconButton(
                       onPressed: () {
                         Get.to(ScreenPost());
                       }, icon:  Icon(Icons.search, color: Colors.black,),)),
                 Container(

                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.grey.withOpacity(0.3),
                     ),
                     child: IconButton(icon: Icon(Icons.message, color: Colors.black,) ,onPressed: () {  },)),
               ],
             ),
           )
         ],
       ).marginOnly(top: 10, bottom: 10),
     ),
     body: Column(
       children: [
         Container(
           width: MediaQuery.of(context).size.width,
           child: Column(
             children: [
               Container(
                 color: Colors.white,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CircleAvatar(),
                       Container(
                         // padding: EdgeInsets.only(top: 15, bottom: 0),
                         height: 43,
                         width: MediaQuery.of(context).size.width*0.7,
                         decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(30),
                           border: Border.all(width: 1)
                         ),
                         child: Padding(
                           padding: EdgeInsets.only( top: 20,left: 10 ,bottom: 0),
                           child: TextField(

                             decoration: InputDecoration(
                               hintText: "What's on your mind",
                               border: InputBorder.none
                             ),
                           ),
                         ),
                       ),
                       Icon(Icons.insert_photo_outlined),
                     ],
                   ),
                 ),
               ).marginOnly(bottom: 10),
               Container(
                 color: Colors.white,
                 child: Column(
                   children: [
                     // ListTile(
                     //   leading: CircleAvatar(),
                     //   title: Text('Name'),
                     //   subtitle: Text('12:36'),
                     //   trailing: Icon(Icons.more_horiz),
                     // )
                     Padding(
                       padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               CircleAvatar(),
                               SizedBox(width: 10,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Name'),
                                   Row(
                                     children: [
                                       Text('20h .'),
                                       Icon(Icons.browser_updated, size: 20,)
                                     ],
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Icon(Icons.more_horiz),
                               Icon(Icons.delete_forever),
                             ],
                           )
                         ],
                       ),
                     ),

                     Container(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Hello dear \nhow are you'),
                           ],
                         ),
                       ),
                     ).marginOnly(bottom: 10),
                     Container(
                       padding: EdgeInsets.only(bottom: 10),
                       child: Image(image: AssetImage('assets/images/multan.jpg')),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 15, bottom: 5, top: 10),
                       child: Row(
                         children: [
                           Icon(Icons.heart_broken_sharp),
                           Text('5')
                         ],
                       ),
                     ),
                     Divider(thickness: 1,),
                     Padding(
                       padding: const EdgeInsets.only(left: 25, bottom: 15, top: 5, right: 25),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               )
             ],
           )
         ),
       ],
     ),
    );
  }
}
