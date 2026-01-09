import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GriditemWidget extends StatelessWidget {
  final List<Map<String, String>> items = const [
    {
      "image":
          "https://unblast.com/wp-content/uploads/2020/04/Working-from-Home-Illustration.jpg",
      "title": "Home",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Work",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Office",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Remote",
    },
        {
      "image":
          "https://unblast.com/wp-content/uploads/2020/04/Working-from-Home-Illustration.jpg",
      "title": "Home",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Work",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Office",
    },
    {
      "image":
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg",
      "title": "Remote",
    },
  ];
  const GriditemWidget({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final item = items[index];
            return GridInfoList(
              imagePath: item['image'] ?? '',
              title: item['title'] ?? '',
            );
          },
          childCount: items.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  
          crossAxisSpacing: 12,
          mainAxisSpacing: 15,
          childAspectRatio: 0.9,
        ),
      ),
    );
  }
}


class GridInfoList extends StatefulWidget {
  final String imagePath;
  final String title;

  const GridInfoList({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  State<GridInfoList> createState() => _GridInfoListState();
}

class _GridInfoListState extends State<GridInfoList> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    final totalBytes =
                        loadingProgress.expectedTotalBytes;
                    final loadedBytes =
                        loadingProgress.cumulativeBytesLoaded;

                    if (totalBytes != null) {
                      _progress = loadedBytes / totalBytes;
                    }

                    return Padding(
                      padding:  EdgeInsets.all(12.r),
                      child: CircularPercentIndicator(
                        radius: 35,
                        lineWidth: 6,
                        percent: _progress.clamp(0.0, 1.0),
                        center: Text(
                          "${(_progress * 100).toInt()}%",
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        progressColor: Colors.blue,
                        backgroundColor: Colors.grey.shade300,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    );
                  },
                  errorBuilder: (_, _, _) =>
                      const Icon(Icons.error),
                ),
              ],
            ),
          ),

           SizedBox(height: 8.h),

          Padding(
            padding:  EdgeInsets.only(bottom: 12.r),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
