import 'package:flutter/material.dart';

class SearchProductField extends StatelessWidget {
  const SearchProductField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      height: height * 0.065,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kPrimaryColor.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: width * 0.04,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Search Products...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
