import 'package:flutter/material.dart';
import 'package:fonify/Controller/company_controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:fonify/View/Custom_container3.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Custom_container2.dart';

class PapularMobiles extends StatefulWidget {
  const PapularMobiles({super.key});

  @override
  State<PapularMobiles> createState() => _PapularMobilesState();
}

class _PapularMobilesState extends State<PapularMobiles> {
  final CompanyController companyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        backgroundColor: AppColors.appBar,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Image.asset("assets/images/logo.jpeg",
            height: 70,
            width: 50,
            fit: BoxFit.contain,),
            SizedBox(width: 10,),
             SizedBox(
              width: 280,
               child: Container(
                height: 40,
                // width: 60,
                decoration: BoxDecoration(
                  color: AppColors.searchBar,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10)
                  ),
                ),
                           ),
             ),
             CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/book.jpeg"),
             )
           

          ],
        )
      ),
      body : Obx((){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.containerColor
                      ),
                      child: Icon(Icons.arrow_back, color: AppColors.arrowColor,size: 15,),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.sort)
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 0.95,
                mainAxisSpacing: 10),
                itemCount: companyController.mobileList.length,
                itemBuilder: (context, index){
                  final mobile = companyController.mobileList[index];
                  return CustomContainer3(mobileimage: mobile.image, name: mobile.name, price: mobile.price);
                },
              ),
            ),
          ],
        );
      })
    );
  }
}