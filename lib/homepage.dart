import 'package:flutter/material.dart';
import './header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Container(
        child: Text("Hello world")
      )
    );
  }
}
