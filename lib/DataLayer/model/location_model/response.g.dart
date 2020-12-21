// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) {
  return LocationResponse(
    hasMore: json['has_more'] as int,
    total: json['has_total'] as int,
    locationList: (json['location_suggestions'] as List)
        ?.map((e) =>
            e == null ? null : Location.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    userHasAddress: json['user_has_addresses'] as bool,
  );
}

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'has_total': instance.total,
      'location_suggestions': instance.locationList,
      'status': instance.status,
      'user_has_addresses': instance.userHasAddress,
    };
