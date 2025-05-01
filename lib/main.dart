import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:cerdas_swamedikasi/app/config/themes/app-theme.dart';
import 'package:cerdas_swamedikasi/app/global_widgets/others/custom-splash-screen.dart';
import 'package:cerdas_swamedikasi/app/routes/app-pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/initial_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialBinding: InitialBindings(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const CustomSplashScreen(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
