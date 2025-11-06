import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/core/router/router.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://zbecupskafbtvylhyxbr.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpiZWN1cHNrYWZidHZ5bGh5eGJyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIxMTc3MDQsImV4cCI6MjA3NzY5MzcwNH0.h4zs-7rp0NKp7trk961-Sa6NYq-y1CHiO-rKW6dSWdk",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Material App',
          getPages: router,
          initialRoute: "/splash",
        );
      },
    );
  }
}
