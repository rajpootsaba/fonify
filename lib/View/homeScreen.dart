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
import 'package:fonify/View/scan_page.dart';
import 'package:fonify/View/settings_page.dart';
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
        toolbarHeight: 50,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ===== Buy & Sell Section =====
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  height: 200,
                  color: AppColors.Container,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Buy & Sell\nMobile Easily",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              "assets/images/4.jfif",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [BuySellButtons()],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // ===== Categories Section =====
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
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
                            InkWell(
                              onTap: () => companyController.scrollLogoLeft(),
                              child: Icon(Icons.arrow_back, size: 20),
                            ),
                            InkWell(
                              onTap: () => companyController.scrollLogoRight(),
                              child: Icon(Icons.arrow_forward, size: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: Obx(() {
                          return ListView.builder(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: (){
                            Get.to(() =>Categories());
                          
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 15),
                           child: Text('View All')),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // ===== Popular Mobiles Section =====
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                            InkWell(
                              onTap: () => companyController.scrollMobileLeft(),
                              child: Icon(Icons.arrow_back, size: 20),
                            ),
                            InkWell(
                              onTap: () => companyController.scrollMobileRight(),
                              child: Icon(Icons.arrow_forward, size: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        child: Obx(() {
                          return ListView.builder(
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
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: (){
                            Get.to(() =>PapularMobiles());
                          
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 15),
                           child: Text('View All')),
                        ],
                      )
                    ],
                  ),
                ),

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
