import 'package:airbnb_app/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => categoryJsonData);
final List<Map<String, dynamic>> categoryJsonData = [
  {
    'id': '1',
    'description': "Designed by David Penner",
    'roomType': "Entire Villa",
    'pricePerNight': 350,
    'country': "Manitoba",
    'city': "Canada",
    'maxGuests': 6,
    'categoryType': "Luxury",
    'amenities': ["Private Pool", "Ocean View", "Garden", "Wi-Fi"],
    'mainPhotoUrl': Assets.images.rentImage2.path,
    'photoUrls': [
      Assets.images.rentImage2.path,
      Assets.images.rentImage3.path,
    ],
  },
  {
    'id': '2',
    'description': "Cozy Apartment in the Heart of City",
    'roomType': "Private Room",
    'pricePerNight': 80,
    'country': "USA",
    'city': "New York",
    'maxGuests': 2,
    'categoryType': "Apartment",
    'amenities': ["City View", "Close to Public Transport", "Wi-Fi"],
    'mainPhotoUrl': Assets.images.rentImage4.path,
    'photoUrls': [
      Assets.images.rentImage4.path,
      Assets.images.rentImage5.path,
    ],
  },
  {
    'id': '3',
    'description': "Mountain Cabin Retreat",
    'roomType': "Entire Cabin",
    'pricePerNight': 150,
    'country': "Canada",
    'city': "Banff",
    'maxGuests': 4,
    'categoryType': "Cabin",
    'amenities': ["Mountain View", "Fireplace", "Pet Friendly"],
    'mainPhotoUrl': Assets.images.rentImage6.path,
    'photoUrls': [
      Assets.images.rentImage6.path,
      Assets.images.rentImage.path,
    ],
  }
  // Add more JSON data as needed...
];
