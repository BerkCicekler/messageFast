import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/providers/friends/friends_provider.dart';
import 'package:messagefast/core/models/user_model.dart';
import 'package:messagefast/core/services/firebase/firebase_store_service.dart';

mixin FriendRequestsOperation {
  
  Future<List<UserModel>?> getAllFriendRequests({required WidgetRef ref}) async {
    List<UserModel>? friendRequests = await FirebaseFireStoreMethods.instance.getAllUsersAsList(usersUIdList: ref.read(friendsProvider).recievedFriendRequests);
    if (friendRequests != null) {
      return friendRequests;
    }
    return null;
  }

  void friendRequestAction(String uId, bool isAccepted) {
    print(uId);
    FirebaseFireStoreMethods.instance.friendRequestAction(targetUId: uId, isAccepted: isAccepted);
  }
}