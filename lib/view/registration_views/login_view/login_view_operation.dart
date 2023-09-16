import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/base/router/app_router.dart';
import 'package:messagefast/core/models/providers/friends/friends_provider.dart';
import 'package:messagefast/core/models/providers/user/user_provider.dart';
import 'package:messagefast/core/services/firebase/firebase_auth_service.dart';
import 'package:messagefast/core/services/firebase/firebase_store_service.dart';
import 'package:messagefast/core/utils/alert_dialog_service.dart';
import 'package:messagefast/main.dart';

mixin LoginViewOperation<LoginView> {
  late final TextEditingController userName;
  late final TextEditingController password;

  void onPressedLogin({required BuildContext context, required WidgetRef ref}) async {
    String? uId = await FirebaseAuthService.instance.signInWithEmailAndPassword(email: userName.text, password: password.text);
    Map<String, dynamic>? userMap = await getUserMapWithUId(uId, context);
    if (userMap != null) {
      userMap["uId"] = uId;
      ref.read(userProvider.notifier).logIn(userMap);
      ref.read(friendsProvider.notifier).addAllFriendsRequests(userMap["sendedFriendRequests"]);
      ref.read(friendsProvider.notifier).addAllFriendsRequestsRecieved(userMap["recievedFriendRequests"]);
      print(userMap["recievedFriendRequests"]);
      getIt<AppRouter>().replace(const DashBoardRoute());   
    }
  }

  Future<Map<String, dynamic>?> getUserMapWithUId(String? uId, BuildContext context) async {
    if (uId != null) {
      Map<String,dynamic>? userModelMap = await FirebaseFireStoreMethods.instance.getUserDatas(uId: uId);
      return userModelMap;
    }else {
      AlertDialogService.notifyUser(context: context, titleText: "Error", contextText: "Account is not exist!", actionText: "Okey");
      return null;
    }
  }


  void customInitState() {
    userName = TextEditingController();
    password = TextEditingController();
    userName.text = "berkbey@gmail.com";
    password.text = "sifre123";
  }

  void customDispose() {
    userName.dispose();
    password.dispose();
  }

}

// kullanıcı isim değişikliği 
// kullanıcı search özelliği