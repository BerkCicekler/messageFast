import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/view/home_views/settings_view/settings_view_operation.dart';
import 'package:messagefast/view/home_views/settings_view/widgets/custom_cupertino_list_tile.dart';

class OthersListSelection extends ConsumerWidget with SettingsViewOperation {
  const OthersListSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      header: Text(
        'Others',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      backgroundColor: Colors.transparent,
      children: [
        const CustomCupertinoListTile(
            label: 'Notifications',
            leadingIcon: CupertinoIcons.bell_fill,
            trailingIcon: Icons.keyboard_arrow_right
          ),
        const CustomCupertinoListTile(
            label: "Info",
            leadingIcon: CupertinoIcons.info,
            trailingIcon: Icons.keyboard_arrow_right
          ),
          CustomCupertinoListTile(label: "Log Out", leadingIcon: Icons.logout, trailingIcon: Icons.keyboard_arrow_right, onTap: () => logOut(ref: ref), color: Colors.red,),
      ],
    );
  }
}
