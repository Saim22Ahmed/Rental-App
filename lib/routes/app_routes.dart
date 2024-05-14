import 'package:airbnb_app/models/category_model/category_model.dart';
import 'package:airbnb_app/pages/BookingDetailsPage.dart';
import 'package:airbnb_app/pages/HomePage.dart';
import 'package:airbnb_app/pages/category_details_page.dart';
import 'package:airbnb_app/pages/splashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // initializing go router
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      //Splash Screen
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreen();
        },
      ),

      // Home Route
      GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: HomePage(),
          );
        },
      ),

      //Booking Details Route
      GoRoute(
        name: 'bookingDetails',
        path: '/bookingDetails',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: BookingDetailsPage(),
          );
        },
      ),
      //CategoryDetail Route
      GoRoute(
        name: 'categoryDetail',
        path: '/categoryDetail',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final category = state.extra as CategoryModel;

          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                  position: offsetAnimation,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: child,
                  ));
            },
            child: CategoryDetailsPage(category: category),
          );
        },
      ),
    ],
  );
}
