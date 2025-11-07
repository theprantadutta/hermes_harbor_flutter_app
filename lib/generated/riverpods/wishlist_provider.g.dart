// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../riverpods/wishlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Wishlist)
const wishlistProvider = WishlistProvider._();

final class WishlistProvider
    extends $NotifierProvider<Wishlist, List<Product>> {
  const WishlistProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'wishlistProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$wishlistHash();

  @$internal
  @override
  Wishlist create() => Wishlist();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$wishlistHash() => r'6b9f45d550b1a36d64ef436efbf43bb8b6a98241';

abstract class _$Wishlist extends $Notifier<List<Product>> {
  List<Product> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Product>, List<Product>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Product>, List<Product>>,
        List<Product>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
