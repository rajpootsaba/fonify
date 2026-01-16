import 'package:flutter/material.dart';
import 'package:fonify/Core/Data/company_names.dart';
import 'package:fonify/Core/Data/MobileImages.dart';
import 'package:fonify/Model/company_model.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  var logoList = <String>[].obs;        // Upar ke logos
  var mobileList = <CompanyModel>[].obs;    // Neeche ke mobiles

  final ScrollController logoScrollController = ScrollController();
  final ScrollController mobileScrollController = ScrollController();

  // Logo scroll
  void scrollLogoRight() {
    logoScrollController.animateTo(
      logoScrollController.offset + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollLogoLeft() {
    logoScrollController.animateTo(
      logoScrollController.offset - 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Mobile scroll
  void scrollMobileRight() {
    mobileScrollController.animateTo(
      mobileScrollController.offset + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollMobileLeft() {
    mobileScrollController.animateTo(
      mobileScrollController.offset - 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    logoScrollController.dispose();
    mobileScrollController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    logoList.assignAll(CompanyNames.companies.map((e) => e.image));
    mobileList.assignAll(MobileImages.mobiles);
  }
}
