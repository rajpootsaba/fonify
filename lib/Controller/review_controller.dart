import 'package:fonify/Core/Data/review_data.dart';
import 'package:fonify/Model/review_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ReviewController extends GetxController {
 RxList<ReviewModel> reviews = <ReviewModel>[].obs; 
 RxInt currentIndex = 0.obs;

@override void onInit(){
    super.onInit();
    reviews.assignAll(localReviews);
  }
  // future main sirf ye method use hoga
  void fetchOnlineReviews() async{
    //reviews.assignAll(apiReviews);
  }
}

