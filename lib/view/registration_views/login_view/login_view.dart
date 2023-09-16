import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messagefast/core/models/constants/padding_constants.dart';
import 'package:messagefast/core/models/singletons/styles/button_styles/button_styles.dart';
import 'package:messagefast/view/registration_views/login_view/login_view_operation.dart';
import 'package:messagefast/widgets/custom_text_field/custom_text_field.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginViewOperation {
  
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: PaddingConstands.instance.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
    
            CustomTextField(controller: userName, label: "Email",),
            const SizedBox(height: 15,),
            CustomTextField(controller: password, label: "Password"),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                onPressedLogin(context: context, ref: ref);
              }, 
              style: ButtonStyles.instance.loginButton.copyWith(minimumSize: MaterialStatePropertyAll(Size(width * 0.95, height * 0.1)) ),
              child: const Text("Login",style: TextStyle(fontSize: 20, color: Colors.white,)),
            ),
          ]),
        ),
      ),
    );
  }
}