// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeUiModel {

 String get title; List<BannerUiModel> get banners; List<ProductUiModel> get popularProducts;
/// Create a copy of HomeUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUiModelCopyWith<HomeUiModel> get copyWith => _$HomeUiModelCopyWithImpl<HomeUiModel>(this as HomeUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUiModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.popularProducts, popularProducts));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(popularProducts));

@override
String toString() {
  return 'HomeUiModel(title: $title, banners: $banners, popularProducts: $popularProducts)';
}


}

/// @nodoc
abstract mixin class $HomeUiModelCopyWith<$Res>  {
  factory $HomeUiModelCopyWith(HomeUiModel value, $Res Function(HomeUiModel) _then) = _$HomeUiModelCopyWithImpl;
@useResult
$Res call({
 String title, List<BannerUiModel> banners, List<ProductUiModel> popularProducts
});




}
/// @nodoc
class _$HomeUiModelCopyWithImpl<$Res>
    implements $HomeUiModelCopyWith<$Res> {
  _$HomeUiModelCopyWithImpl(this._self, this._then);

  final HomeUiModel _self;
  final $Res Function(HomeUiModel) _then;

/// Create a copy of HomeUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? banners = null,Object? popularProducts = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerUiModel>,popularProducts: null == popularProducts ? _self.popularProducts : popularProducts // ignore: cast_nullable_to_non_nullable
as List<ProductUiModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeUiModel].
extension HomeUiModelPatterns on HomeUiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeUiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeUiModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeUiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeUiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<BannerUiModel> banners,  List<ProductUiModel> popularProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeUiModel() when $default != null:
return $default(_that.title,_that.banners,_that.popularProducts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<BannerUiModel> banners,  List<ProductUiModel> popularProducts)  $default,) {final _that = this;
switch (_that) {
case _HomeUiModel():
return $default(_that.title,_that.banners,_that.popularProducts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<BannerUiModel> banners,  List<ProductUiModel> popularProducts)?  $default,) {final _that = this;
switch (_that) {
case _HomeUiModel() when $default != null:
return $default(_that.title,_that.banners,_that.popularProducts);case _:
  return null;

}
}

}

/// @nodoc


class _HomeUiModel implements HomeUiModel {
  const _HomeUiModel({required this.title, required final  List<BannerUiModel> banners, required final  List<ProductUiModel> popularProducts}): _banners = banners,_popularProducts = popularProducts;
  

@override final  String title;
 final  List<BannerUiModel> _banners;
@override List<BannerUiModel> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<ProductUiModel> _popularProducts;
@override List<ProductUiModel> get popularProducts {
  if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularProducts);
}


/// Create a copy of HomeUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeUiModelCopyWith<_HomeUiModel> get copyWith => __$HomeUiModelCopyWithImpl<_HomeUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeUiModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._popularProducts, _popularProducts));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_popularProducts));

@override
String toString() {
  return 'HomeUiModel(title: $title, banners: $banners, popularProducts: $popularProducts)';
}


}

/// @nodoc
abstract mixin class _$HomeUiModelCopyWith<$Res> implements $HomeUiModelCopyWith<$Res> {
  factory _$HomeUiModelCopyWith(_HomeUiModel value, $Res Function(_HomeUiModel) _then) = __$HomeUiModelCopyWithImpl;
@override @useResult
$Res call({
 String title, List<BannerUiModel> banners, List<ProductUiModel> popularProducts
});




}
/// @nodoc
class __$HomeUiModelCopyWithImpl<$Res>
    implements _$HomeUiModelCopyWith<$Res> {
  __$HomeUiModelCopyWithImpl(this._self, this._then);

  final _HomeUiModel _self;
  final $Res Function(_HomeUiModel) _then;

/// Create a copy of HomeUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? banners = null,Object? popularProducts = null,}) {
  return _then(_HomeUiModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerUiModel>,popularProducts: null == popularProducts ? _self._popularProducts : popularProducts // ignore: cast_nullable_to_non_nullable
as List<ProductUiModel>,
  ));
}


}

/// @nodoc
mixin _$BannerUiModel {

 String get id; String get imageUrl; String get linkUrl; String get title;
/// Create a copy of BannerUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerUiModelCopyWith<BannerUiModel> get copyWith => _$BannerUiModelCopyWithImpl<BannerUiModel>(this as BannerUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,linkUrl,title);

@override
String toString() {
  return 'BannerUiModel(id: $id, imageUrl: $imageUrl, linkUrl: $linkUrl, title: $title)';
}


}

/// @nodoc
abstract mixin class $BannerUiModelCopyWith<$Res>  {
  factory $BannerUiModelCopyWith(BannerUiModel value, $Res Function(BannerUiModel) _then) = _$BannerUiModelCopyWithImpl;
@useResult
$Res call({
 String id, String imageUrl, String linkUrl, String title
});




}
/// @nodoc
class _$BannerUiModelCopyWithImpl<$Res>
    implements $BannerUiModelCopyWith<$Res> {
  _$BannerUiModelCopyWithImpl(this._self, this._then);

  final BannerUiModel _self;
  final $Res Function(BannerUiModel) _then;

/// Create a copy of BannerUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? linkUrl = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerUiModel].
extension BannerUiModelPatterns on BannerUiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerUiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerUiModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerUiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerUiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String linkUrl,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerUiModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.linkUrl,_that.title);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String linkUrl,  String title)  $default,) {final _that = this;
switch (_that) {
case _BannerUiModel():
return $default(_that.id,_that.imageUrl,_that.linkUrl,_that.title);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imageUrl,  String linkUrl,  String title)?  $default,) {final _that = this;
switch (_that) {
case _BannerUiModel() when $default != null:
return $default(_that.id,_that.imageUrl,_that.linkUrl,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _BannerUiModel implements BannerUiModel {
  const _BannerUiModel({required this.id, required this.imageUrl, required this.linkUrl, required this.title});
  

@override final  String id;
@override final  String imageUrl;
@override final  String linkUrl;
@override final  String title;

/// Create a copy of BannerUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerUiModelCopyWith<_BannerUiModel> get copyWith => __$BannerUiModelCopyWithImpl<_BannerUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,linkUrl,title);

@override
String toString() {
  return 'BannerUiModel(id: $id, imageUrl: $imageUrl, linkUrl: $linkUrl, title: $title)';
}


}

/// @nodoc
abstract mixin class _$BannerUiModelCopyWith<$Res> implements $BannerUiModelCopyWith<$Res> {
  factory _$BannerUiModelCopyWith(_BannerUiModel value, $Res Function(_BannerUiModel) _then) = __$BannerUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String imageUrl, String linkUrl, String title
});




}
/// @nodoc
class __$BannerUiModelCopyWithImpl<$Res>
    implements _$BannerUiModelCopyWith<$Res> {
  __$BannerUiModelCopyWithImpl(this._self, this._then);

  final _BannerUiModel _self;
  final $Res Function(_BannerUiModel) _then;

/// Create a copy of BannerUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? linkUrl = null,Object? title = null,}) {
  return _then(_BannerUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProductUiModel {

 String get id; String get name; String get imageUrl; int get price; double get rating; int get reviewCount; String get formattedPrice;
/// Create a copy of ProductUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUiModelCopyWith<ProductUiModel> get copyWith => _$ProductUiModelCopyWithImpl<ProductUiModel>(this as ProductUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.formattedPrice, formattedPrice) || other.formattedPrice == formattedPrice));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,rating,reviewCount,formattedPrice);

@override
String toString() {
  return 'ProductUiModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, rating: $rating, reviewCount: $reviewCount, formattedPrice: $formattedPrice)';
}


}

/// @nodoc
abstract mixin class $ProductUiModelCopyWith<$Res>  {
  factory $ProductUiModelCopyWith(ProductUiModel value, $Res Function(ProductUiModel) _then) = _$ProductUiModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String imageUrl, int price, double rating, int reviewCount, String formattedPrice
});




}
/// @nodoc
class _$ProductUiModelCopyWithImpl<$Res>
    implements $ProductUiModelCopyWith<$Res> {
  _$ProductUiModelCopyWithImpl(this._self, this._then);

  final ProductUiModel _self;
  final $Res Function(ProductUiModel) _then;

/// Create a copy of ProductUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? price = null,Object? rating = null,Object? reviewCount = null,Object? formattedPrice = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,formattedPrice: null == formattedPrice ? _self.formattedPrice : formattedPrice // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductUiModel].
extension ProductUiModelPatterns on ProductUiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductUiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductUiModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductUiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductUiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  int price,  double rating,  int reviewCount,  String formattedPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUiModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.rating,_that.reviewCount,_that.formattedPrice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  int price,  double rating,  int reviewCount,  String formattedPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductUiModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.rating,_that.reviewCount,_that.formattedPrice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String imageUrl,  int price,  double rating,  int reviewCount,  String formattedPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductUiModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.rating,_that.reviewCount,_that.formattedPrice);case _:
  return null;

}
}

}

/// @nodoc


class _ProductUiModel implements ProductUiModel {
  const _ProductUiModel({required this.id, required this.name, required this.imageUrl, required this.price, required this.rating, required this.reviewCount, required this.formattedPrice});
  

@override final  String id;
@override final  String name;
@override final  String imageUrl;
@override final  int price;
@override final  double rating;
@override final  int reviewCount;
@override final  String formattedPrice;

/// Create a copy of ProductUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUiModelCopyWith<_ProductUiModel> get copyWith => __$ProductUiModelCopyWithImpl<_ProductUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.formattedPrice, formattedPrice) || other.formattedPrice == formattedPrice));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,rating,reviewCount,formattedPrice);

@override
String toString() {
  return 'ProductUiModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, rating: $rating, reviewCount: $reviewCount, formattedPrice: $formattedPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductUiModelCopyWith<$Res> implements $ProductUiModelCopyWith<$Res> {
  factory _$ProductUiModelCopyWith(_ProductUiModel value, $Res Function(_ProductUiModel) _then) = __$ProductUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String imageUrl, int price, double rating, int reviewCount, String formattedPrice
});




}
/// @nodoc
class __$ProductUiModelCopyWithImpl<$Res>
    implements _$ProductUiModelCopyWith<$Res> {
  __$ProductUiModelCopyWithImpl(this._self, this._then);

  final _ProductUiModel _self;
  final $Res Function(_ProductUiModel) _then;

/// Create a copy of ProductUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? price = null,Object? rating = null,Object? reviewCount = null,Object? formattedPrice = null,}) {
  return _then(_ProductUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,formattedPrice: null == formattedPrice ? _self.formattedPrice : formattedPrice // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
