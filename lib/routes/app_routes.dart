import 'package:airbnb_app/pages/BookingDetailsPage.dart';
import 'package:airbnb_app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // initializing go router
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      // Home Route
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
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
          }),
    ],
  );
}
