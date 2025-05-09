import 'package:flutter/material.dart';

class SearchProductField extends StatelessWidget {
  final bool enabled;
  final FocusNode? focusNode;

  const SearchProductField({
    super.key,
    this.enabled = true,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      height: MediaQuery.sizeOf(context).height * 0.06,
      decoration: BoxDecoration(
        color: kPrimaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(25), // More rounded
        border: Border.all(
          color: kPrimaryColor.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(
          enabled: enabled,
          // contentPadding: const EdgeInsets.only(top: 12),
          border: InputBorder.none,
          hintText: 'Search Hermes Harbor...',
          hintStyle: TextStyle(
            color: Colors.black.withValues(alpha: 0.7),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: Hero(
            tag: 'searchIcon',
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 24,
              ),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.mic,
              color: kPrimaryColor.withValues(alpha: 0.8),
            ),
            onPressed: () {
              // Voice search functionality
            },
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
