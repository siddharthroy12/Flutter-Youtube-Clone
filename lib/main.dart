import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import './homepage.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() {
  runApp(MaterialApp(
    title: "Youtube Clone",
    debugShowCheckedModeBanner: false,
    scrollBehavior: MyCustomScrollBehavior(),
    home: const HomePage(),
    theme: ThemeData(
      brightness:  Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF181818),
      splashColor: const Color(0xFF373737),
      colorScheme: const ColorScheme.dark(
        outline: Color(0xFF373737),
        surfaceTint: Color(0xFF121212)
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFF373737),
        shape: StadiumBorder(side: BorderSide(color: Color(0xFF4B4B4B), width: 1)),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(
          fontSize: 15
        )
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF202020),
      )
    )
  ));
}



