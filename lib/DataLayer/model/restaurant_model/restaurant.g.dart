// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    json['id'] as String,
    json['address'] as String,
    json['cuisines'] as String,
    json['currency'] as String,
    json['imageUrl'] as String,
    json['name'] as String,
    json['priceRange'] as int,
    json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    json['thumbUrl'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'currency': instance.currency,
      'thumbUrl': instance.thumbUrl,
      'imageUrl': instance.imageUrl,
      'cuisines': instance.cuisines,
      'address': instance.address,
      'rating': instance.rating,
      'priceRange': instance.priceRange,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    average: json['average'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'text': instance.text,
      'average': instance.average,
    };
