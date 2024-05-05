import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider = ChangeNotifierProvider<CategoryListProvider>(
  (ref) => CategoryListProvider(),
);

class CategoryListProvider extends ChangeNotifier {
  //List of Category
  final List<Map<String, dynamic>> categoryList = [
    {'type': 'Hotel', 'icon': Icons.hotel_rounded},
    {'type': 'Apartment', 'icon': Icons.apartment_rounded},
    {'type': 'Villa', 'icon': Icons.villa_rounded},
    {'type': 'Resort', 'icon': Icons.holiday_village_rounded},
    {'type': 'Bnb', 'icon': Icons.bedroom_child_rounded},
  ];

  // selected Index of  Category List

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
