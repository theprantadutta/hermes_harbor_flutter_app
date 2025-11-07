// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../riverpods/cart_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartList)
const cartListProvider = CartListProvider._();

final class CartListProvider extends $NotifierProvider<CartList, List<Cart>> {
  const CartListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cartListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cartListHash();

  @$internal
  @override
  CartList create() => CartList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Cart> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Cart>>(value),
    );
  }
}

String _$cartListHash() => r'ac1c21d3af54b09dc3708a6e3efd46d940457f4e';

abstract class _$CartList extends $Notifier<List<Cart>> {
  List<Cart> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Cart>, List<Cart>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Cart>, List<Cart>>, List<Cart>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
