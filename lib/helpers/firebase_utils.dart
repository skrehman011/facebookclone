import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUtils {
  static Future<String> uploadSingleImage(
      String filePath, String firebasePathWithFilename,
      {Function(String url)? onSuccess,
      Function(String error)? onError,
      Function(double progress)? onProgress}) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child(firebasePathWithFilename);
    final UploadTask uploadTask = storageReference.putFile(File(filePath));

    uploadTask.snapshotEvents.listen((event) {
      double progress =
          event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
      if (onProgress != null) {
        onProgress(progress.toDouble());
      }
    }).onError((error) {
      // do something to handle error
      if (onError != null) {
        onError(error.toString());
      }
    });

    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    if (onSuccess != null) {
      onSuccess(url);
    }
    return url;
  }

  static Future<List<String>> uploadMultipleFiles(
      List<String> imagesPaths, String firebasePathWithFilenameWithoutExtension,
      {Function(int which, double progress)? onProgress,
      required String extension}) async {
    if (imagesPaths.isEmpty) {
      return [];
    }

    List<String> urls = [];

    await Future.forEach(imagesPaths, (String path) async {
      int index = imagesPaths.indexOf(path);
      var url = await uploadSingleImage(path,
          "${firebasePathWithFilenameWithoutExtension}_${index}.$extension",
          onProgress: (progress) {
        if (onProgress != null) {
          onProgress(index, progress);
        }
      });
      urls.add(url);
    });

    return urls;
  }

  static String get myId => FirebaseAuth.instance.currentUser!.uid;

  static int get newId => DateTime.now().millisecondsSinceEpoch;
}
