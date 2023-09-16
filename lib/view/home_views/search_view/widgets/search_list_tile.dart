import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/view/home_views/search_view/search_operation.dart';

class SearchListTile extends StatelessWidget with SearchOperation{
  final String uId, name, imageURL;
  final WidgetRef ref;
  SearchListTile({super.key, required this.name, required this.imageURL, required this.uId, required this.ref});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
      backgroundImage: NetworkImage(
        imageURL != "" ? imageURL : "https://firebasestorage.googleapis.com/v0/b/messagefast-d9c7c.appspot.com/o/default_profile_picture.jpg?alt=media&token=8b6bfc09-efd0-4a7a-bb80-3265c76e5395"),
      ),
      title: Text(name),
      trailing: IconButton(icon: const Icon(Icons.add), onPressed: () {
        tryToSendFriendRequest(ref: ref, targetId: uId);
      },),
      onTap: null,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}