import 'package:flutter/material.dart';
import 'package:fonify/Core/Theme/app_color.dart';

class PuplarMobileContainer extends StatefulWidget {
   final String mobileimage;
   final String name;
   final String price;
  const PuplarMobileContainer({super.key,
   required this.mobileimage,
   required this.name,
   required this.price});

  @override
  State<PuplarMobileContainer> createState() => _PuplarMobileContainerState();
}

class _PuplarMobileContainerState extends State<PuplarMobileContainer> {
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
      child: Column(
        children: [
          Image.asset(widget.mobileimage,width: 40, height: 40,),
          Text(widget.name,
          style: TextStyle(fontSize: 10),),
          Text(widget.price, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
      ]),
    );
  }
}