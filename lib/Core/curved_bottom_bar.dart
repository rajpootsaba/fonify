import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:fonify/Controller/bottom_nev_controller.dart';
import 'package:get/get.dart';

class CurvedBottomBar extends StatefulWidget {
  const CurvedBottomBar({super.key});

  @override
  State<CurvedBottomBar> createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  final BottomNavController controller = Get.find<BottomNavController>();
  @override
  Widget build(BuildContext context) {
   return Obx(() {
   
      return CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple,
        height: 60,
        index: controller.currentIndex.value,
        items: [
          CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined, color: Colors.white),
              label: 'Home', labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.category, color: Colors.white),
              label: 'Category', labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.camera_alt, color: Colors.white),
              label: 'Scan', labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.shopping_cart, color: Colors.white),
              label: 'Cart', labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(Icons.settings, color: Colors.white),
              label: 'Settings', labelStyle: TextStyle(color: Colors.white)),
        ],
        onTap: (index) => controller.changeIndex(index),
      );
    });
  }
}