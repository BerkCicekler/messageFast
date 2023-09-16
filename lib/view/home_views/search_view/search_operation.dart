import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/providers/friends/friends_provider.dart';
import 'package:messagefast/core/models/providers/user/user_provider.dart';
import 'package:messagefast/core/services/firebase/firebase_store_service.dart';

mixin SearchOperation {
  late final TextEditingController searchController;

  ValueNotifier<String> currentSearch = ValueNotifier<String>("");

  Timer? _inputTimer;

  void customInitelize() {
    searchController = TextEditingController();
  }

  void customDispose() {
    searchController.dispose();
  }

    void onNickNameChange(String text) {
    if (text == "" || text.length < 4) {
      if (_inputTimer != null) {
          _inputTimer!.cancel();
      }
      return;
    }
      if (_inputTimer != null) {
        _inputTimer!.cancel(); // When text changes cancel the old timer
      }
      _inputTimer = Timer(const Duration(milliseconds: 300), () {
        // if user don't give input for 0.3 second this code will execute
        currentSearch.value = searchController.text;
      });
  }


  Future<Map<String,dynamic>> getUserByName() async{
    if (currentSearch.value.length < 4) return {};
    return await FirebaseFireStoreMethods.instance.getUserByName(currentSearch.value);
  }

  void sendFriendRequest({required String senderId, required String targetId, required List<String> userSendedFreindRequests}) {
    print(senderId);
    print(targetId);
    FirebaseFireStoreMethods.instance.sendFriendRequest(senderId: senderId, targetId: targetId, usersSendedFriendRequestsList: userSendedFreindRequests, );
  }

  void tryToSendFriendRequest({required WidgetRef ref, required String targetId}) {
    if (ref.read(friendsProvider.notifier).isFriendResuestAlreadySended(targetId)) {
      print("bu adam ekli");
    }else {
      print("bu adam ekli değil");
      var user = ref.read(userProvider);
      ref.read(friendsProvider.notifier).addFriendsRequest(targetId);
      sendFriendRequest(senderId: user.uId, targetId: targetId, userSendedFreindRequests: ref.read(friendsProvider).sendedFriendRequests, );
    }
  }

}