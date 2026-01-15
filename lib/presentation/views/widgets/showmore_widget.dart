import 'package:flutter/material.dart';

class ShowmoreWidget extends StatefulWidget {
  const ShowmoreWidget({super.key});

  @override
  State<ShowmoreWidget> createState() => _ShowmoreWidgetState();
}

class _ShowmoreWidgetState extends State<ShowmoreWidget> {
  bool isShowMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product Details", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
              IconButton(
                onPressed: (){
                  setState(() {
                    isShowMore = !isShowMore;
                    
                  });
                }, icon: Icon(Icons.keyboard_arrow_down_rounded)),
            ],
          ),
      ],
    );
  }
}