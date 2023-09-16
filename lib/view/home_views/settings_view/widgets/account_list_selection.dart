import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/base/router/app_router.dart';
import 'package:messagefast/view/home_views/settings_view/settings_view_operation.dart';
import 'package:messagefast/view/home_views/settings_view/widgets/custom_cupertino_list_tile.dart';

class AccountListSelection extends ConsumerWidget with SettingsViewOperation {
  const AccountListSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      header: Text('Account', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
      backgroundColor: Colors.transparent,
      children: [
        CustomCupertinoListTile(label: "Edit Account", leadingIcon: Icons.account_circle_outlined, trailingIcon: Icons.keyboard_arrow_right, onTap: () => pushSettingPage(pageRoute: const EditAccountRoute())),
        const CustomCupertinoListTile(label: "Friends", leadingIcon: Icons.people, trailingIcon: Icons.keyboard_arrow_right),
        CustomCupertinoListTile(label: "Friend Requests", leadingIcon: Icons.people, trailingIcon: Icons.keyboard_arrow_right, onTap: () => pushSettingPage(pageRoute: const FriendRequestsRoute()),),
      ],
    );
  }
}