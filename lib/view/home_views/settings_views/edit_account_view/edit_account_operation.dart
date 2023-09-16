import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messagefast/core/services/firebase/firebase_store_service.dart';

mixin EditAccountOperation<EditAccountView, FunctionalAppBar> {
  late final TextEditingController nameController;
  late final TextEditingController userController;

  bool canSaveChanges = false;

  ValueNotifier<Color> saveTextColor = ValueNotifier<Color>(Colors.grey);

  Timer? _inputTimer;

  void _setValuesAsSave(bool isSaveAble) {
    if (isSaveAble) {
      canSaveChanges = true;
      saveTextColor.value = Colors.blue;
    }else {
      canSaveChanges = false;
      saveTextColor.value = Colors.grey;
    }
  }

  void customInitState() {
    nameController = TextEditingController();
    userController = TextEditingController();
  }

  void customDispose() {
    nameController.dispose();
    userController.dispose();
  }

  void saveChanges() {
    if (canSaveChanges) {
      FirebaseFireStoreMethods.instance.changeUserNameAndName(userName: userController.text, name: nameController.text);
    }
  }

  void onNameChange(String name) {
    if (name.length < 4) {
      _setValuesAsSave(false);
    }
  }

  void onNickNameChange(String text) {
      canSaveChanges = false;
      if (_inputTimer != null) {
        _inputTimer!.cancel(); // When text changes cancel the old timer
      }
      _inputTimer = Timer(const Duration(milliseconds: 400), () {
        // if user don't give input for 0.4 second this code will execute
        _controlIsNameAvailable(text);
      });
  }

  void _controlIsNameAvailable(String name) async{
    if (name.length < 4) {
      _setValuesAsSave(false);
      return;
    }
    if (await FirebaseFireStoreMethods.instance.isUserNameAvailable(userName: name)) {
      _setValuesAsSave(true);
    }else {
      _setValuesAsSave(false);
    }
  }

}