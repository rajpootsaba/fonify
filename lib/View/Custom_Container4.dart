import 'package:flutter/material.dart';
import 'package:fonify/Core/Theme/app_color.dart';

class CustomContainer4 extends StatefulWidget {
   final String mobileimage;
  //  final String name;
  //  final String price;
  const CustomContainer4({super.key,
  required this.mobileimage,
  //  required this.name,
  //  required this.price
   });

  @override
  State<CustomContainer4> createState() => _CustomContainer4State();
}

class _CustomContainer4State extends State<CustomContainer4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.customContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(
         color: Colors.black.withOpacity(0.3), // shadow color
      blurRadius: 6,                        // softness
      offset: Offset(0, 3),           
        )]
      ),
      child:  Column(
          children: [
            Center(child: Image.asset(widget.mobileimage,width: 50, height: 50,)),
            // Text(widget.name,
            // style: TextStyle(fontSize: 10),),
            // Text(widget.price, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
        ]),
      
    );
  }
}