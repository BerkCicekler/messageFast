import 'package:flutter/material.dart';
import 'package:messagefast/widgets/alert_dialogs/alert_dialog.dart';
import 'package:messagefast/widgets/alert_dialogs/alert_dialog_action.dart';

final class AlertDialogService {

  AlertDialogService._();

  /// this method will appear Yes Or No AlertDialog and return the user's selection
  static Future<bool> getUserAction({required BuildContext context, required String titleText, required String contextText}) async{
    bool result = await showDialog(context: context, builder: (context) => CustomAlertDialogAction(title: titleText, contextText: contextText));
    return result;
  }

  static void notifyUser({required BuildContext context, required String titleText, required String contextText, required String actionText}) {
    showDialog(context: context, builder: (context) => CustomAlertDialog(title: titleText, contextText: contextText, actionText: actionText,));
  }

}