/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'currency')
  final String currency;
  @JsonKey(name: 'thumbUrl')
  final String thumbUrl;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'cuisines')
  final String cuisines;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'rating')
  final Rating rating;
  @JsonKey(name: 'priceRange')
  final int priceRange;

  String get priceDisplay {
    final buffer = StringBuffer();
    for (int i = 0; i < priceRange; i++) {
      buffer.write(currency);
    }
    return buffer.toString();
  }

  Restaurant(this.id, this.address, this.cuisines, this.currency, this.imageUrl,
      this.name, this.priceRange, this.rating, this.thumbUrl, this.url);

  // Restaurant.fromJson(json)
  //     : id = json['id'],
  //       name = json['name'],
  //       url = json['url'],
  //       thumbUrl = json['thumb'],
  //       imageUrl = json['featured_image'],
  //       priceRange = json['price_range'],
  //       currency = json['currency'],
  //       cuisines = json['cuisines'],
  //       address = json['location']['address'],
  //       rating = Rating.fromJson(json['user_rating']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Restaurant && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'average')
  final String average;

  Rating({this.average, this.text});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
// Rating.fromJson(Map json)
//     : text = json['rating_text'].toString(),
//       average = json['aggregate_rating'].toString();
}
