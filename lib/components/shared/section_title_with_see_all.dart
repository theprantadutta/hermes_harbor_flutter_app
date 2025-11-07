import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hermes_harbor_flutter_app/screens/view_all_screen.dart';

import '../../constants/design_tokens.dart';

// class SectionTitleWithSeeAll extends StatelessWidget {
//   final String title;

//   const SectionTitleWithSeeAll({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         GestureDetector(
//           onTap: () => context.push(ViewAllScreen.kRouteName),
//           child: const Text(
//             'See All',
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class SectionTitleWithSeeAll extends StatelessWidget {
  final String title;
  const SectionTitleWithSeeAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.headingSmall(
            color: isDarkTheme ? Colors.white : Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () => context.push(ViewAllScreen.kRouteName),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
          ),
          child: Text(
            'See All',
            style: AppTextStyle.labelLarge(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
