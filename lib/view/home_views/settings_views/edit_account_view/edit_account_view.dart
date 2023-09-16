import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/constants/color_constants.dart';
import 'package:messagefast/view/home_views/settings_views/edit_account_view/edit_account_operation.dart';
@RoutePage()
class EditAccountView extends ConsumerStatefulWidget {
  const EditAccountView({super.key});

  @override
  _EditAccountViewState createState() => _EditAccountViewState();
}

class _EditAccountViewState extends ConsumerState<EditAccountView> with EditAccountOperation {

  @override
  void initState() {
    super.initState();
    customInitState();
  }
  @override
  void dispose() {
    super.dispose();
    customDispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ValueListenableBuilder<Color>(
          valueListenable: saveTextColor,
          builder: (context, value, child) {
            return FunctionalAppBar(color: value, onTap: saveChanges);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoFormSection(
              backgroundColor: Colors.transparent,
              children: [
              CupertinoTextFormFieldRow(
                autocorrect: false,
                enableSuggestions: false,
                placeholder: "Name",
                controller: nameController,
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                maxLength: 20,
              ),
              CupertinoTextFormFieldRow(
                autocorrect: false,
                enableSuggestions: false,
                placeholder: "User name",
                controller: userController,
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                onChanged: onNickNameChange,
                maxLength: 20,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class FunctionalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Function() onTap;
  const FunctionalAppBar({super.key, required this.color, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.15),
      shadowColor: Colors.transparent,
      elevation: 0,
      leading: Center(
        child: RichText(text: TextSpan(text: "Exit", style: const TextStyle(color: ColorConstants.cancelText), recognizer: TapGestureRecognizer()..onTap = () {
          context.router.pop();
        })),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: RichText(text: TextSpan(text: "Save", style: TextStyle(color: color), recognizer: TapGestureRecognizer()..onTap = onTap)),
          ),
        ),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}