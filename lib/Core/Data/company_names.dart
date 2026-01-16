import 'package:fonify/Model/company_model.dart';

class CompanyNames {
  static  List<CompanyModel> companies = [
   CompanyModel(image: "assets/images/apple.png", name: "iPhone 14", price: "\$999"),
  CompanyModel(image: "assets/images/samsung.png", name: "Samsung S23", price: "\$899"),
  // CompanyModel(image: "assets/images/xiaomi.png", name: "Xiaomi 13", price: "\$699"),
  CompanyModel(image: "assets/images/oppo.png", name: "Oppo Reno 10", price: "\$499"),
  CompanyModel(image: "assets/images/vivo.png", name: "Vivo V30", price: "\$599"),
  CompanyModel(image: "assets/images/realme.jpeg", name: "Realme GT", price: "\$399"),
  // CompanyModel(image: "assets/images/oneplus.jpeg"),
  // CompanyModel(image: "assets/images/motorola.png"),
  CompanyModel(image: "assets/images/nokia.png", name: "Nokia G21", price: "\$299"),
  CompanyModel(image: "assets/images/huawei.jpeg", name: "huawei", price: "\$999"),
   CompanyModel(image: "assets/images/oppo.png", name: "Oppo Reno 10", price: "\$499"),
  CompanyModel(image: "assets/images/vivo.png", name: "Vivo V30", price: "\$599"),
  CompanyModel(image: "assets/images/realme.jpeg", name: "Realme GT", price: "\$399"),
  CompanyModel(image: "assets/images/apple.png", name: "iPhone 14", price: "\$999"),
  CompanyModel(image: "assets/images/samsung.png", name: "Samsung S23", price: "\$899"),
   CompanyModel(image: "assets/images/nokia.png", name: "Nokia G21", price: "\$299"),
  CompanyModel(image: "assets/images/huawei.jpeg", name: "huawei", price: "\$999"),
   CompanyModel(image: "assets/images/oppo.png", name: "Oppo Reno 10", price: "\$499"),
  ];
  // agr future m API se Json loaungi
  static List<CompanyModel> fromJsonList(List<Map<String, dynamic>> jsonList){
  return jsonList.map((e) => CompanyModel.fromJson(e)).toList();
  }
}
