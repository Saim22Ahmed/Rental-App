import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/provider/navBar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNavBar extends ConsumerWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, -1.0),
          )
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(),
        child: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
            ref.watch(navBarProvider).changeIndex(index);
          },
          indicatorColor: Colors.transparent,
          selectedIndex: ref.watch(navBarProvider).selectedIndex,
          height: 56.0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'Explore',
              selectedIcon: Icon(
                Icons.search,
                color: themecolor,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
              selectedIcon: Icon(
                Icons.favorite,
                color: themecolor,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.travel_explore_outlined),
              label: 'Trips',
              selectedIcon: Icon(
                Icons.travel_explore_rounded,
                color: themecolor,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: 'Inbox',
              selectedIcon: Icon(
                Icons.message,
                color: themecolor,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Log in',
              selectedIcon: Icon(
                Icons.person,
                color: themecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
