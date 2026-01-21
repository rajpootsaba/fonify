import 'package:flutter/material.dart';
import 'package:fonify/Controller/bottom_nev_controller.dart';
import 'package:fonify/Controller/company_controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:fonify/View/Custom_Container4.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
   final CompanyController companyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.background,
      body: Obx((){
        return Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<BottomNavController>().changeIndex(0);
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
            Expanded(child: 
            
            
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              
              crossAxisCount: 4, crossAxisSpacing: 5, childAspectRatio: 1, mainAxisSpacing: 5),
            
            itemCount: companyController.logoList.length,
      itemBuilder: (context, index) {
        final logo = companyController.logoList[index];
        return CustomContainer4(mobileimage: logo);
      },))
          ],
        );
      }
        
      ),
      );
  }
}