import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/home_entity.dart';

part 'home_resp_dto.freezed.dart';
part 'home_resp_dto.g.dart';

/// 홈 화면 응답 DTO
@freezed
abstract class HomeRespDto with _$HomeRespDto {
  const factory HomeRespDto({
    required String title,
    required List<BannerDto> banners,
    required List<ProductDto> popularProducts,
  }) = _HomeRespDto;

  factory HomeRespDto.fromJson(Map<String, dynamic> json) => 
      _$HomeRespDtoFromJson(json);
}

/// 배너 정보 DTO
@freezed
abstract class BannerDto with _$BannerDto {
  const factory BannerDto({
    required String id,
    required String imageUrl,
    required String linkUrl,
    required String title,
  }) = _BannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) => 
      _$BannerDtoFromJson(json);
}

/// 상품 정보 DTO
@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String name,
    required String imageUrl,
    required int price,
    required double rating,
    required int reviewCount,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => 
      _$ProductDtoFromJson(json);
}

/// DTO -> Entity 변환 확장 함수
extension HomeRespDtoX on HomeRespDto {
  HomeEntity toEntity() {
    return HomeEntity(
      title: title,
      banners: banners.map((banner) => banner.toEntity()).toList(),
      popularProducts: popularProducts.map((product) => product.toEntity()).toList(),
    );
  }
}

extension BannerDtoX on BannerDto {
  BannerEntity toEntity() {
    return BannerEntity(
      id: id,
      imageUrl: imageUrl,
      linkUrl: linkUrl,
      title: title,
    );
  }
}

extension ProductDtoX on ProductDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      reviewCount: reviewCount,
    );
  }
}
