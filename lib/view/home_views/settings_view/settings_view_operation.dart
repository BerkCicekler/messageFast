import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messagefast/core/base/router/app_router.dart';
import 'package:messagefast/core/models/providers/user/user_provider.dart';
import 'package:messagefast/core/services/firebase/firebase_storage_service.dart';
import 'package:messagefast/core/utils/image_picker.dart';
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

  void changeProfilePicture({required ImageSource source, required String name}) async {
    final file = await ImagePickerUtil().pickSingleImage(source: source);
    if (file != null) {
      FirebaseStorageService().test(file: file, name: name);
    }
  }

}