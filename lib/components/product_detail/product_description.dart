import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Section Title ---
          Text(
            'DETAILS',
            style: GoogleFonts.raleway(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),

          // --- Text with Read More ---
          AnimatedSize(
            duration: 300.ms,
            curve: Curves.easeInOut,
            child: GptMarkdown(
              widget.description,
              style: GoogleFonts.raleway(
                fontSize: 14,
                height: 1.6,
              ),
              maxLines: _isExpanded ? null : 3,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
            ),
          ),

          // --- Read More Button ---
          TextButton(
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(
              _isExpanded ? 'READ LESS' : 'READ MORE',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
