import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/widgets/iconlabel_widget.dart';

class Updatescreen extends StatelessWidget {
  const Updatescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://previews.123rf.com/images/topvectors/topvectors1506/topvectors150600015/40658771-travel-vacation-flat-design-set-vector-concept-illustration-travel-banner.jpg'),
                  fit: BoxFit.contain
                  ),
              ),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  IconlabelWidget(img: 'assets/images/google.png', label: 'Hello'),
                  IconlabelWidget(img: 'asset/images/google.png', label: 'Hello'),
                  IconlabelWidget(img: 'asset/images/google.png', label: 'Hello'),
                ],
              ),
            )
          ]
        ),
      ) ,
    );
  }
}
Widget headerContent (){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://previews.123rf.com/images/topvectors/topvectors1506/topvectors150600015/40658771-travel-vacation-flat-design-set-vector-concept-illustration-travel-banner.jpg')
        ),
    ),
  );
}