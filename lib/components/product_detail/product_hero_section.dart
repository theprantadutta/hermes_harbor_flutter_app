import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductHeroSection extends StatefulWidget {
  final List<String> images;

  const ProductHeroSection({
    super.key,
    required this.images,
  });

  @override
  State<ProductHeroSection> createState() => _ProductHeroSectionState();
}

class _ProductHeroSectionState extends State<ProductHeroSection> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // --- Image Gallery ---
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          itemCount: widget.images.length,
          itemBuilder: (_, index) => CachedNetworkImage(
            imageUrl: widget.images[index],
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            placeholder: (_, __) => Container(
              color: Colors.grey[200],
            ),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
        ),

        // --- Gradient Overlay ---
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.1),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),
        ),

        // --- Back Button ---
        Positioned(
          top: MediaQuery.of(context).padding.top + 12,
          left: 12,
          child: FloatingActionButton.small(
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            elevation: 0,
            child: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // --- Image Indicator ---
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: widget.images.length,
              effect: ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.white.withValues(alpha: 0.5),
                spacing: 6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
