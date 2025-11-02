import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/screens/home_screen.dart';
import 'package:inventory_app/ui/screens/products_screen.dart';
import 'package:inventory_app/ui/widgets/navigator_item.dart';
import 'package:sizer/sizer.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _currentIndex = _pageController.page!.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Palette.background,
          border: Border(
            top: BorderSide(color: Palette.gray.withValues(alpha: 0.5)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              NavigatorItem(
                icon: Icons.home,
                title: "Home",
                isSelected: _currentIndex == 0,
                onTap: () {
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              NavigatorItem(
                icon: Icons.list,
                title: "Listado de productos",
                isSelected: _currentIndex == 1,
                onTap: () {
                  _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Palette.background,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [HomeScreen(), ProductsScreen()],
        ),
      ),
    );
  }
}
