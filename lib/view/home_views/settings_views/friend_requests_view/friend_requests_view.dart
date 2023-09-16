import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/friend_requests_operation.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/widgets/friend_requests_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FriendRequestsView extends ConsumerWidget with FriendRequestsOperation {
  const FriendRequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FutureBuilder(future: getAllFriendRequests(ref: ref), builder:(context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data == null) return Text("error");
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
/*
Column(children: [
          friendRequestListTile(senderUId: 'sex', imageURL: '', name: 'sadasdsa',)
        ]),
*/