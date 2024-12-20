import "package:flutter/material.dart";
import "package:huatah/models/category.dart";

class SpendInsight extends ChangeNotifier {
  // Username: Currently hardcoded
  String userName = "Daniel";

  // List of Category objects: Currently hardcoded
  List<Category> categoryList = [
    Category(
      id: "1",
      title: "Groceries",
      totalAmount: 242.93,
      color: 0xFF00E5C4,
    ),
    Category(
      id: "2",
      title: "Arts & Entertainment",
      totalAmount: 108.17,
      color: 0xFFFFE548,
    ),
    Category(
      id: "3",
      title: "Restaurants",
      totalAmount: 74.46,
      color: 0xFFFFA093,
    ),
    Category(
      id: "4",
      title: "Sports",
      totalAmount: 34.26,
      color: 0xFF91EBF7,
    ),
    Category(
      id: "5",
      title: "Others",
      totalAmount: 71.12,
      color: 0xFF6C82D0,
    ),
  ];

  // Methods
  void addCategory(Category category) {
    categoryList.add(category);
    notifyListeners();
  }

  void removeCategory(Category category) {
    categoryList.remove(category);
    notifyListeners();
  }
}
