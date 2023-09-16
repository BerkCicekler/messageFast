import 'package:flutter/material.dart';
import 'package:messagefast/core/constants/color_constants.dart';
import 'package:messagefast/view/home_views/contact_view/contaxt_view_operation.dart';

class ContactListTile extends StatelessWidget with ContactViewOperation {
  final String name, imageURL, lastMessage, id;
  final int unseenMessageCount;
  const ContactListTile({super.key, required this.id, required this.name, required this.imageURL, required this.lastMessage, required this.unseenMessageCount});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
      backgroundImage: NetworkImage(
        imageURL),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: unseenMessageCount > 0 ? ColorConstants.newMessageNumContainer : null,
          borderRadius: BorderRadius.circular(10)
        ),
        child: unseenMessageCount > 0 ? Center(child: Text(unseenMessageCount.toString())) : null,
      ),
      onTap: () => pushChatPage(context: context, id: id),
      splashColor: Colors.transparent,
    );
  }
}