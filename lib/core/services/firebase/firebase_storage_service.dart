import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final class FirebaseStorageService {

  Future<String?> saveProfilePicture({required File file, required String name}) async{
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("users_profile_picture/");
    final otherRef = imagesRef.child(name);
    try {
      otherRef.putFile(file);
      String url = await otherRef.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
