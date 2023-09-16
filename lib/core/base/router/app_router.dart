import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/view/home_views/contact_view/contact_view.dart';
import 'package:messagefast/view/home_views/dashboard_view.dart';
import 'package:messagefast/view/home_views/chat_view/chat_view.dart';
import 'package:messagefast/view/home_views/search_view/search_view.dart';
import 'package:messagefast/view/home_views/settings_view/settings_view.dart';
import 'package:messagefast/view/home_views/settings_views/edit_account_view/edit_account_view.dart';
import 'package:messagefast/view/home_views/settings_views/friend_requests_view/friend_requests_view.dart';
import 'package:messagefast/view/registration_views/login_view/login_view.dart';

part 'app_router.gr.dart'; 

@AutoRouterConfig(replaceInRouteName: "View,Route")      
class AppRouter extends _$AppRouter {      

  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: LoginRoute.page, path: "/", initial: true),
    AutoRoute(page: DashBoardRoute.page, path: "/dashboard", 
    children: [
      AutoRoute(page: SearchRoute.page, path: "search"),
      AutoRoute(page: ContactRoute.page, path: "contact", initial: true),
      AutoRoute(page: SettingsRoute.page, path: "settings")
    ]),
    AutoRoute(page: EditAccountRoute.page, path: "/dashboard/settings/editAccount"),
    AutoRoute(page: FriendRequestsRoute.page, path: "/dashboard/settings/friendRequests"),
    AutoRoute(page: ChatRoute.page, path: "/contact/chat")

  ];
}    