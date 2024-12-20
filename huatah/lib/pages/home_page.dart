import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';
import 'package:huatah/components/category_tile.dart';
import 'package:huatah/components/pie_section_tile.dart';
import 'package:huatah/models/category.dart';
import 'package:huatah/models/spend_insight.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Gradients variable
  final gradient1 = const LinearGradient(
    colors: [
      Color.fromARGB(255, 115, 29, 255),
      Color.fromARGB(255, 0, 255, 148),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final gradient2 = const LinearGradient(
    colors: [
      Color(0xFF59114D),
      Color(0xFFE98A16),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Methods

  @override
  Widget build(BuildContext context) {
    return Consumer<SpendInsight>(
      builder: (context, value, child) => Column(
        children: [
          // Welcome text
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 25.0,
            ),
            child: Row(
              children: [
                // Image
                Image(
                  image: AssetImage("lib/pics/welcome.png"),
                  height: 36,
                ),

                // Welcome Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: ShaderMask(
                        shaderCallback: (bounds) => gradient1.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: Text(
                          "Welcome back, ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),

                // Name
                Text(
                  value.userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Chart + Overall
          SizedBox(
            height: 180,
            width: 180,
            child: Stack(
              children: [
                // Pie chart
                PieChart(
                  PieChartData(
                    sections: value.categoryList.map((cat) {
                      return PieSectionTile(category: cat)
                          .toPieChartSectionData();
                    }).toList(),
                    sectionsSpace: 0,
                  ),
                ),

                // Total
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "RM786.53",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.keyboard_double_arrow_down_rounded,
                            color: Colors.red,
                          ),
                          Text(
                            "-25%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 20),

          // Overall button
          Container(
            width: 188,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF013B36),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left icon
                  Icon(
                    Icons.chevron_left_rounded,
                    size: 20,
                    color: Colors.white,
                  ),

                  // Overall
                  Text(
                    "Overall",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  // Right icon
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Another page for Category List
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.only(top: 30.0, left: 35.0, right: 35.0),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31),
                  topRight: Radius.circular(31),
                ),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF7F7F7),
                    width: 1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Color(0xFF012622).withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: -3,
                    offset: Offset(0, -7),
                  ),
                ],
              ),
              child: Column(
                // Date
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => gradient2.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "1st Nov 2024 - 7th Nov 2024",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Spend Insights
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.categoryList.length,
                      itemBuilder: (context, index) {
                        // Get category from provider
                        Category category = value.categoryList[index];

                        return CategoryTile(
                          category: category,
                          onTap: () => {},
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
