import 'package:flutter/material.dart';

class GriditemWidget extends StatelessWidget {
  final List<Map<String,String>> items;
  final double horizontalPadding;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  const GriditemWidget({
    super.key,
    required this.items,
    this.horizontalPadding = 16,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: horizontalPadding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items[index];
            return GridInfoList(
              imagePath: item['image']!,
              title: item['title']!,
            );
          },
          childCount: items.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
          ),
          ),
      );
  }
}
class GridInfoList extends StatelessWidget {
  final String imagePath;
  final String title;

  const GridInfoList({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 70,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  
}
