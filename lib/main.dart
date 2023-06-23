import 'package:flutter/material.dart';
import 'calculator_screen.dart';
// import 'package:device_preview/device_preview.dart';


// void main() => runApp(
//   DevicePreview(
   
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home:Calculator(),
    );
  }
}

