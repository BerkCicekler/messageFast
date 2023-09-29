import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/user_model.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(super.state);

  /// this method will change the current model with a new model with all variables empty strings
  void logOut() {
    state = UserModel.empty();
  }

  /// change the model 
  void logIn(Map<String, dynamic> map) {
    state = UserModel.fromMap(map);
  }

  /// change profilePicture variable
  void changeProfilePicture(String link) {
    state = state.copyWith(profilePictureURL: link);
  }
  
}