import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:messagefast/core/base/router/app_router.dart';
import 'package:messagefast/core/services/firebase/firebase_messaging_service.dart';
import 'package:messagefast/theme/dark_theme.dart';
import 'package:messagefast/theme/light_theme.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  getIt.registerSingleton<AppRouter>(AppRouter()); 

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessagingService.connectNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    FlutterNativeSplash.remove();
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Message Fast',
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      )
    );
  }
}
