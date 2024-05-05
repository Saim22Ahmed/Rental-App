import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    String? id,
    String? description,
    String? roomType,
    double? pricePerNight,
    String? country,
    String? city,
    int? maxGuests,
    String? categoryType,
    List<String>? amenities,
    String? mainPhotoUrl,
    List<String>? photoUrls,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);
}
