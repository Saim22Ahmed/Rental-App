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
          return const HomePage();
        },
      ),

      //Booking Details Route
      GoRoute(
          name: 'bookingDetails',
          path: '/bookingDetails',
          builder: (BuildContext context, GoRouterState state) {
            return const BookingDetailsPage();
          })
    ],
  );
}
