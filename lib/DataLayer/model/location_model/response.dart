import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/location.dart';
part 'response.g.dart';

@JsonSerializable()
class LocationResponse {
  @JsonKey(name: 'has_more')
  int hasMore;
  @JsonKey(name: 'has_total')
  int total;
  @JsonKey(name: 'location_suggestions')
  List<Location> locationList;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'user_has_addresses')
  bool userHasAddress;

  LocationResponse(
      {this.hasMore,
      this.total,
      this.locationList,
      this.status,
      this.userHasAddress});

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
