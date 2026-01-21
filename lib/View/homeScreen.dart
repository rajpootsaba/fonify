import 'package:flutter/material.dart';
import 'package:fonify/Controller/bottom_nev_controller.dart';
import 'package:fonify/Controller/company_controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:fonify/Core/Widgets/buy_sell_buttons.dart';
import 'package:fonify/Core/curved_bottom_bar.dart';
import 'package:fonify/View/Custom_conatiner.dart';
import 'package:fonify/View/Custom_container2.dart';
import 'package:fonify/View/Papular_Mobiles.dart';
import 'package:fonify/View/cart_page.dart';
import 'package:fonify/View/categories.dart';
import 'package:fonify/View/review_carosel.dart';
import 'package:fonify/View/scan_page.dart';
import 'package:fonify/View/settings_page.dart';
import 'package:fonify/View/viewall_categories.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // 🔹 Controllers
  final BottomNavController bottomController = Get.put(BottomNavController());
  final CompanyController companyController = Get.put(CompanyController());

  // 🔹 Screens for bottom nav
  final List<Widget> screens = [
    SizedBox(), // Home screen content is handled separately
    Categories(),
    ScanPage(),
    CartPage(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true, 
      appBar: AppBar(
        // toolbarHeight: 40,
        backgroundColor: AppColors.appBar,
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.jpeg",
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/book.jpeg"),
            ),
          ],
        ),
      ),

      // ===== Body =====
      body: Obx(() {
        // 🔹 If Home tab is selected
        if (bottomController.currentIndex.value == 0) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ===== Buy & Sell Section =====
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  height: 140,
                  color: AppColors.Container,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Buy & Sell\nMobile Easily",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Container(
                              // color: const Color.fromRGBO(244, 67, 54, 1),
                              height: 70,
                              width: 90,
                              child: Image.asset(
                                "assets/images/4.jfif",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('The future of AI will see home robots having enhanced\nintelligence, increased, and becoming more\n personal possibly cute. For example home robots\n will overcome navigation direction.', textAlign: TextAlign.justify,style: TextStyle(color: Colors.white, fontSize: 5),),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [BuySellButtons()],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),

                // ===== Categories Section =====
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             Spacer(),
                           
                          ElevatedButton(onPressed: (){
                            Get.to(() =>ViewallCategories());
                          
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15),
                           child: Text('View All', style: TextStyle(fontSize: 10),)),
                        
                      
                            // Spacer(),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () => companyController.scrollLogoLeft(),
                              child: Icon(Icons.arrow_back, size: 17),
                            ),
                            InkWell(
                              onTap: () => companyController.scrollLogoRight(),
                              child: Icon(Icons.arrow_forward, size: 17, ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 85,
                        child: Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: companyController.logoScrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: companyController.logoList.length,
                            itemBuilder: (context, index) {
                              final logo = companyController.logoList[index];
                              return CustomContainer(companyimage: logo);
                            },
                          );
                        }),
                      ),
                     
                    ],
                  ),
                ),

                SizedBox(height: 2),

                // ===== Popular Mobiles Section =====
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, ),
                        child: Row(
                          children: [
                            Text(
                              "Popular Mobiles",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                           
                          ElevatedButton(onPressed: (){
                            Get.to(() =>PapularMobiles());
                          
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15),
                           child: Text('View All',style: TextStyle(fontSize: 10),)),
                      
                            
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () => companyController.scrollMobileLeft(),
                              child: Icon(Icons.arrow_back, size: 17),
                            ),
                            InkWell(
                              onTap: () => companyController.scrollMobileRight(),
                              child: Icon(Icons.arrow_forward, size: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 105,
                        child: Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: companyController.mobileScrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: companyController.mobileList.length,
                            itemBuilder: (context, index) {
                              final mobile = companyController.mobileList[index];
                              return PuplarMobileContainer(
                                mobileimage: mobile.image,
                                name: mobile.name,
                                price: mobile.price,
                              );
                            },
                          );
                        }),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 2,),
                ReviewCarousel()

              ],
            ),
          );
        } else {
          // 🔹 Other tabs
          return screens[bottomController.currentIndex.value];
        }
      }),

      // ===== Curved Bottom Navigation Bar =====
      bottomNavigationBar: CurvedBottomBar(),
    );
  }
}
