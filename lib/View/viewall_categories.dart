import 'package:flutter/material.dart';
import 'package:fonify/Controller/company_controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:get/get.dart';

import 'Custom_Container4.dart';

class ViewallCategories extends StatefulWidget {
  const ViewallCategories({super.key});

  @override
  State<ViewallCategories> createState() => _ViewallCategoriesState();
}

class _ViewallCategoriesState extends State<ViewallCategories> {
    final CompanyController companyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: AppColors.background,
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
            Expanded(
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
            Expanded(child: 
            
            
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              
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