import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/core/constants/padding_constants.dart';
import 'package:messagefast/view/home_views/settings_view/widgets/account_list_selection.dart';
import 'package:messagefast/view/home_views/settings_view/widgets/others_list_selection.dart';
import 'package:messagefast/view/home_views/settings_view/widgets/profile_holder.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: PaddingConstants.pagePadding,
          child: SingleChildScrollView(
            child: _SettingsViewBody(),
          ),
        ),
      ),
    );
  }
}

class _SettingsViewBody extends StatelessWidget {
  const _SettingsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileHolder(),
        AccountListSelection(),
        OthersListSelection()
      ],
    );
  }
}
