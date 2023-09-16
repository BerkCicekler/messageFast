import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/base/router/app_router.dart';
import 'package:messagefast/core/models/providers/user/user_provider.dart';
import 'package:messagefast/main.dart';

mixin SettingsViewOperation<SettingView, AccountListSelection, OthersListSelection> {

  /// this will push the screen that user want to go
  /// u have to set the pageRoute arg manually
  void pushSettingPage({required PageRouteInfo pageRoute}) {
    getIt<AppRouter>().push(pageRoute);  
  }

  void logOut({required WidgetRef ref}) {
    ref.read(userProvider.notifier).logOut();
    getIt<AppRouter>().replace(const LoginRoute());
  }

}