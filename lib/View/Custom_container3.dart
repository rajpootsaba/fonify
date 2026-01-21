import 'package:flutter/material.dart';
import 'package:fonify/Core/Theme/app_color.dart';

class CustomContainer3 extends StatefulWidget {
  final String mobileimage;
   final String name;
   final String price;
  const CustomContainer3({super.key,
  required this.mobileimage,
   required this.name,
   required this.price});

  @override
  State<CustomContainer3> createState() => _CustomContainer3State();
}

class _CustomContainer3State extends State<CustomContainer3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // padding: EdgeInsets.symmetric( vertical: 10),
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
          Center(
            child: Container(
              // padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 11),
              height: 110,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: Image.asset(widget.mobileimage, fit: BoxFit.cover,)),
          ),
          SizedBox(height: 15,),
          Text("Model: ${widget.name}",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
           SizedBox(height: 15,),
          Text("Price: ${widget.price}", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),)
      ]),
    );
  }
}