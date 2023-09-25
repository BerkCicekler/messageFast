import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/core/models/providers/friends/friends_provider.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/friend_requests_operation.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/widgets/friend_requests_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FriendRequestsView extends ConsumerStatefulWidget  {
  const FriendRequestsView({super.key});

  @override
  ConsumerState<FriendRequestsView> createState() => _FriendRequestsViewState();
}

class _FriendRequestsViewState extends ConsumerState<FriendRequestsView> with FriendRequestsOperation {
  @override
  Widget build(BuildContext context) {
    var x = ref.watch(friendsProvider).recievedFriendRequests;
    print("sadasd $x");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FutureBuilder(future: getAllFriendRequests(ref: ref), builder:(context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data == null) return const Text("error");
                    List<Widget> widgets = [];
                      for (var element in snapshot.data!) {
                        widgets.add(friendRequestListTile(name: element.name, imageURL: element.profilePictureURL, senderUId: element.uId));
                      }
                      return Column(
                        children: widgets,
                      );
                    }
                }
                return const Text("error");
        },) 
      ),
    );
  }
}