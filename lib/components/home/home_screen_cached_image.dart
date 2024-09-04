import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreenCachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxShape boxShape;
  final EdgeInsets margin;

  const HomeScreenCachedImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.boxShape = BoxShape.rectangle,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        margin: margin,
        width: width,
        height: height,
        child: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: kPrimaryColor,
            size: 45,
          ),
        ),
      ),
      cacheManager:
          CacheManager(Config(imageUrl, stalePeriod: const Duration(days: 7))),
      errorWidget: (context, url, error) => Container(
        margin: margin,
        height: height,
        width: width,
        child: Icon(
          Icons.error,
          size: 100,
          color: Colors.red,
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius:
              boxShape == BoxShape.rectangle ? BorderRadius.circular(10) : null,
          shape: boxShape,
        ),
      ),
    );
  }
}

class HomeScreenCachedImageSkeletor extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;

  const HomeScreenCachedImageSkeletor({
    super.key,
    required this.width,
    required this.height,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/d_S5gxu_S1P6NR1gXeMthZeBzkrQMHdI5uvXrpn3nfJuXpCjlqhLQKH_hbOxTHxFhp5WugVOEcl4WDrv9rmKBDOMExhKU5KmmLFQVg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
