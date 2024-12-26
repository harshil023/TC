import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_setup_flutter_getx/views/splash/splash_binding.dart';

import '../routes/app_pages.dart';
import '../style/color_constants.dart';
import '../utils/app_constants.dart';
import 'app_controller.dart';
import 'package:project_setup_flutter_getx/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends GetView<AppController> {
  MyApp({Key? key}) : super(key: key);

  final AppController _controller = Get.put(AppController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica Neue",
        primarySwatch: ColorConstants.appColor,
      ),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            child: child!, data: data.copyWith(textScaleFactor: 1));
      },
      locale: Locale(_controller.locale),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      title: AppConstants.appName,
      initialBinding: SplashBinding(),
    );
  }
}
