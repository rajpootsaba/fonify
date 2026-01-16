import 'package:flutter/material.dart';
import 'package:fonify/Core/Theme/app_color.dart';

class CustomContainer extends StatefulWidget {
  final String companyimage;
  const CustomContainer({super.key,
  required this.companyimage});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.customContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(
         color: Colors.black.withOpacity(0.3), // shadow color
      blurRadius: 6,                        // softness
      offset: Offset(0, 3),           
        )]
      ),
      child: Center(
        child: Image.asset(widget.companyimage),
      ),
    );
  }
}