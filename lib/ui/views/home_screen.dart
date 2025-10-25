import 'package:flutter/material.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: AppText(text: "Home")),
    );
  }
}
