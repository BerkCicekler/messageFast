import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/core/base/router/app_router.dart';

mixin ContactViewOperation<ContactView,ContactListTile> {

  void pushChatPage({required BuildContext context,required String id}) {
    context.router.push(ChatRoute(id: id));
  }

}