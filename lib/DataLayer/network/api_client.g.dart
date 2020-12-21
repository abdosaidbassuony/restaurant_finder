// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://developers.zomato.com/api/v2.1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LocationResponse> fetchLocations(
      {query,
      count = 10,
      accept = 'application/json',
      userKey = ' 9f8a3896a12b14d982b5deb8acfae6e5'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query, r'count': count};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/locations',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Accept': accept, r'user-key': userKey},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LocationResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Restaurant>> fetchRestaurants(
      {userKey = ' 9f8a3896a12b14d982b5deb8acfae6e5',
      locationId,
      locationType,
      query,
      count = 10}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'entity_id': locationId,
      r'entity_type': locationType,
      r'q': query,
      r'count': count
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'user-key': userKey},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Restaurant.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
