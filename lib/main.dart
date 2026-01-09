import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/screens/splashscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ ,child){
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
        debugShowCheckedModeBanner: false,
        home: const Splashscreen(),
        );
      },
    );
  }
}

