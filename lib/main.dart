import 'package:flutter/material.dart';
import './homepage.dart';

void main() {
  runApp(MaterialApp(
    title: "Youtube Clone",
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(
      brightness:  Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF181818),
      splashColor: const Color(0xFF373737),
      colorScheme: const ColorScheme.dark(
        outline: Color(0xFF303030),
        surfaceTint: Color(0xFF121212)
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF202020),
      )
    )
    )
  );
}



