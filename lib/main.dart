import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Menu Cart',
        home: HomeScreen(),
      ),
    );
  }
}
