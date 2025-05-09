import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/selectors.dart';
import '../../dummy/dummy_carousel_items.dart';
import 'home_screen_top_bar.dart';

class HomeScreenHeroSection extends StatelessWidget {
  final bool showDarkStatusBar;

  const HomeScreenHeroSection({super.key, required this.showDarkStatusBar});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.58,
      systemOverlayStyle:
          showDarkStatusBar ? kDefaultLightUiStyle : kDefaultDarkUiStyle,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          child: PageView.builder(
            itemCount: dummyCarouselItems.length,
            itemBuilder: (context, index) {
              final item = dummyCarouselItems[index];
              final color = item['color'] as Color?;
              return Stack(
                key: ValueKey(item['id']),
                fit: StackFit.expand,
                children: [
                  // Parallax Image Background
                  Positioned.fill(
                    child: Hero(
                      tag: 'carousel_${item['id']}',
                      child: CachedNetworkImage(
                        imageUrl: item['image'] as String,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),

                  // Gradient Veil
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                        stops: const [0.0, 0.3, 1.0],
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tag
                          Animate(
                            effects: [
                              FadeEffect(duration: 500.ms),
                              SlideEffect(
                                begin: const Offset(-0.5, 0),
                                curve: Curves.easeOutCubic,
                              )
                            ],
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: color?.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                item['tag'] as String,
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2.5,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Title
                          Animate(
                            effects: [
                              FadeEffect(delay: 200.ms, duration: 800.ms),
                              SlideEffect(
                                begin: const Offset(0, 0.5),
                                curve: Curves.decelerate,
                              )
                            ],
                            child: Text(
                              item['title'] as String,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 36,
                                height: 1.2,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // CTA Button
                          Animate(
                            effects: [
                              FadeEffect(delay: 400.ms),
                              ScaleEffect(
                                  begin: const Offset(0.8, 0.8),
                                  curve: Curves.elasticOut)
                            ],
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color?.withValues(alpha: 0.4),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 8,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              icon: const Icon(Icons.arrow_forward, size: 20),
                              label: Text(
                                item['cta'] as String,
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      title: const HomeScreenTopBar(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
