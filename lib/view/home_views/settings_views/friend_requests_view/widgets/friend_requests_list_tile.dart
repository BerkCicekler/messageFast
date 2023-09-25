import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/friend_requests_operation.dart';

class friendRequestListTile extends ConsumerWidget with FriendRequestsOperation {
  final String name, imageURL, senderUId;
  const friendRequestListTile({super.key, required this.name, required this.imageURL, required this.senderUId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  ListTile(
      leading: CircleAvatar(
      backgroundImage: NetworkImage(
        imageURL != "" ? imageURL : "https://firebasestorage.googleapis.com/v0/b/messagefast-d9c7c.appspot.com/o/default_profile_picture.jpg?alt=media&token=8b6bfc09-efd0-4a7a-bb80-3265c76e5395"),
      ),
      title: Text(name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.close), onPressed: () => friendRequestAction(senderUId, false, ref),),
          IconButton(icon: const Icon(Icons.check), onPressed: () => friendRequestAction(senderUId, true, ref),),
        ],
      ),
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
} 