import 'package:contractus/models/category.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CategoryCard extends StatefulWidget {
  CategoryCard({required this.category});
  Category category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: kWhite,
        boxShadow: const [
          BoxShadow(
            color: kBorderColorTextField,
            blurRadius: 7.0,
            spreadRadius: 1.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            height: 39,
            width: 39,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(widget.category.img), fit: BoxFit.cover),
            ),
          ),

          const SizedBox(width: 5.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.category.title,
                style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2.0),
              Text(
                'Related all categories',
                style: kTextStyle.copyWith(color: kLightNeutralColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
