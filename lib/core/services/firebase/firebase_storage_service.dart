import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final class FirebaseStorageService {

  void test({required File file, required String name}) async{
    final storageRef = FirebaseStorage.instance.ref();
    final imagesRef = storageRef.child("users_profile_picture/");
    final otherRef = imagesRef.child(name);
    try {
      await otherRef.putFile(file);
    } catch (e) {
      
    }
  }
}
