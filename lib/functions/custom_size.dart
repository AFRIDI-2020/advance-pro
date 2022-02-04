import 'package:flutter/material.dart';

double customSize(BuildContext context, double percentOfWidth) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * percentOfWidth;
}