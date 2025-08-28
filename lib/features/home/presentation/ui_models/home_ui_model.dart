import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/home_entity.dart';

part 'home_ui_model.freezed.dart';

/// 홈 화면 UI 모델
@freezed
abstract class HomeUiModel with _$HomeUiModel {
  const factory HomeUiModel({
    required String title,
    required List<BannerUiModel> banners,
    required List<ProductUiModel> popularProducts,
  }) = _HomeUiModel;
}

/// 배너 UI 모델
@freezed
abstract class BannerUiModel with _$BannerUiModel {
  const factory BannerUiModel({
    required String id,
    required String imageUrl,
    required String linkUrl,
    required String title,
  }) = _BannerUiModel;
}

/// 상품 UI 모델
@freezed
abstract class ProductUiModel with _$ProductUiModel {
  const factory ProductUiModel({
    required String id,
    required String name,
    required String imageUrl,
    required int price,
    required double rating,
    required int reviewCount,
    required String formattedPrice,
  }) = _ProductUiModel;
}

/// HomeUiModel 확장 메소드
extension HomeUiModelX on HomeUiModel {
  /// Entity에서 UI 모델 생성
  static HomeUiModel fromEntity(HomeEntity entity) {
    return HomeUiModel(
      title: entity.title,
      banners: entity.banners.map((banner) => BannerUiModelX.fromEntity(banner)).toList(),
      popularProducts: entity.popularProducts.map((product) => ProductUiModelX.fromEntity(product)).toList(),
    );
  }
  
  /// UI 모델에서 Entity 변환
  /// UI 모델에서 Entity 생성
  HomeEntity toEntity() {
    return HomeEntity(
      title: title,
      banners: banners.map((banner) => banner.toEntity()).toList(),
      popularProducts: popularProducts.map((product) => product.toEntity()).toList(),
    );
  }
}

/// BannerUiModel 확장 메소드
extension BannerUiModelX on BannerUiModel {
  /// Entity에서 UI 모델 생성
  static BannerUiModel fromEntity(BannerEntity entity) {
    return BannerUiModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      linkUrl: entity.linkUrl,
      title: entity.title,
    );
  }
  
  /// UI 모델에서 Entity 변환
  /// UI 모델에서 Entity 생성
  BannerEntity toEntity() {
    return BannerEntity(
      id: id,
      imageUrl: imageUrl,
      linkUrl: linkUrl,
      title: title,
    );
  }
}

/// ProductUiModel 확장 메소드
extension ProductUiModelX on ProductUiModel {
  /// Entity에서 UI 모델 생성
  static ProductUiModel fromEntity(ProductEntity entity) {
    return ProductUiModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
      formattedPrice: '${entity.price.toString().replaceAllMapped(
        RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), 
        (Match m) => "${m[1]},"
      )}원',
    );
  }
  
  /// UI 모델에서 Entity 변환
  /// UI 모델에서 Entity 생성
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
