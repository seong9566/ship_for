/// 홈 화면 엔티티
class HomeEntity {
  final String title;
  final List<BannerEntity> banners;
  final List<ProductEntity> popularProducts;

  const HomeEntity({
    required this.title,
    required this.banners,
    required this.popularProducts,
  });
}

/// 배너 정보 엔티티
class BannerEntity {
  final String id;
  final String imageUrl;
  final String linkUrl;
  final String title;

  const BannerEntity({
    required this.id,
    required this.imageUrl,
    required this.linkUrl,
    required this.title,
  });
}

/// 상품 정보 엔티티
class ProductEntity {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  final double rating;
  final int reviewCount;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });
}
