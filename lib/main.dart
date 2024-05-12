import 'package:airbnb_app/pages/BookingDetailsPage.dart';
import 'package:airbnb_app/pages/HomePage.dart';
import 'package:airbnb_app/routes/app_routes.dart';
import 'package:airbnb_app/themes/dark_theme.dart';
import 'package:airbnb_app/themes/llight_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(
      child: DevicePreview(
          enabled: false, builder: (BuildContext context) => const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, child) => MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
