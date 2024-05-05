// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String?,
      description: json['description'] as String?,
      roomType: json['roomType'] as String?,
      pricePerNight: (json['pricePerNight'] as num?)?.toDouble(),
      country: json['country'] as String?,
      city: json['city'] as String?,
      maxGuests: (json['maxGuests'] as num?)?.toInt(),
      categoryType: json['categoryType'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mainPhotoUrl: json['mainPhotoUrl'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'roomType': instance.roomType,
      'pricePerNight': instance.pricePerNight,
      'country': instance.country,
      'city': instance.city,
      'maxGuests': instance.maxGuests,
      'categoryType': instance.categoryType,
      'amenities': instance.amenities,
      'mainPhotoUrl': instance.mainPhotoUrl,
      'photoUrls': instance.photoUrls,
    };
