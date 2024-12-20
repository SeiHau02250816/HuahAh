import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';
import 'package:huatah/models/category.dart';

class PieSectionTile {
  final Category category;

  const PieSectionTile({
    required this.category,
  });

  PieChartSectionData toPieChartSectionData() {
    return PieChartSectionData(
      title: category.title,
      color: Color(category.color),
      value: category.totalAmount,
      showTitle: false, // Modify this as needed
      radius: 35, // Modify this as needed
    );
  }
}
