import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/view/home_views/contact_view/contaxt_view_operation.dart';
import 'package:messagefast/view/home_views/contact_view/widgets/contact_list_tile.dart';
import 'package:messagefast/widgets/search_text_field/search_text_field.dart';


@RoutePage()
class ContactView extends StatelessWidget with ContactViewOperation {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: _ContactViewBody(),
        ),
      ),
    );
  }
}

class _ContactViewBody extends StatelessWidget {
  const _ContactViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(
          controller: TextEditingController(),
          onChange: (p0) {
            
          },
        ),
        ContactListTile(id: "1",name: 'Mr. Berk', lastMessage: "What are you doing mate ?", unseenMessageCount: 0, imageURL: 'https://firebasestorage.googleapis.com/v0/b/messagefast-d9c7c.appspot.com/o/default_profile_picture.jpg?alt=media&token=8b6bfc09-efd0-4a7a-bb80-3265c76e5395')
    
      ],
    );
  }
}