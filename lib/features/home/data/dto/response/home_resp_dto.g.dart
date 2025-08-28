// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeRespDto _$HomeRespDtoFromJson(Map<String, dynamic> json) => _HomeRespDto(
  title: json['title'] as String,
  banners: (json['banners'] as List<dynamic>)
      .map((e) => BannerDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  popularProducts: (json['popularProducts'] as List<dynamic>)
      .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeRespDtoToJson(_HomeRespDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'banners': instance.banners,
      'popularProducts': instance.popularProducts,
    };

_BannerDto _$BannerDtoFromJson(Map<String, dynamic> json) => _BannerDto(
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String,
  linkUrl: json['linkUrl'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$BannerDtoToJson(_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'linkUrl': instance.linkUrl,
      'title': instance.title,
    };

_ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => _ProductDto(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
);

Map<String, dynamic> _$ProductDtoToJson(_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
    };
