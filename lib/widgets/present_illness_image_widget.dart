import 'package:flutter/material.dart';

Widget presentIllnessImageWidget(context, presentIllnessImageUrl) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: Image.network(presentIllnessImageUrl).image,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}
