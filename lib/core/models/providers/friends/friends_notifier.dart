import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/friends_model.dart';

class FriendsNotifier extends StateNotifier<Friends> {
  FriendsNotifier(super.state);


  bool isFriendResuestAlreadySended(String uId) {
    return state.sendedFriendRequests.contains(uId);
  }

  void addFriendsRequest(String uId) {
    state.sendedFriendRequests.add(uId);
  }

  void addAllFriendsRequests(List<String>? list) {
    if (list != null) {
      state.sendedFriendRequests = list.toList();
    }else {
      state.sendedFriendRequests = [];
    }
    
  }

  void addFriendsRequestRecieved(String uId) {
    state.recievedFriendRequests.add(uId);
  }

  void addAllFriendsRequestsRecieved(List<String>? list) {
    if (list != null) {
      state.recievedFriendRequests = list.toList();
    }else {
      state.recievedFriendRequests = [];
    }
    
  }

}