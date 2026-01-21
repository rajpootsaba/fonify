import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fonify/Controller/review_controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:get/get.dart';

class ReviewCarousel extends StatefulWidget {
  const ReviewCarousel({super.key});

  @override
  State<ReviewCarousel> createState() => _ReviewCarouselState();
}

class _ReviewCarouselState extends State<ReviewCarousel> {
  final ReviewController controller = Get.put(ReviewController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=> CarouselSlider(
          options: CarouselOptions(
        onPageChanged: (index, reason){
          controller.currentIndex.value = index;
        },
        height: 130,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: true,
        viewportFraction: 0.9,
          ),
          items: controller.reviews.map((review) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: AppColors.ReviewCarousel,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        
              /// Rating stars
             RatingBar.builder(
              initialRating: review.rating.toDouble(),
              minRating: 1,
              allowHalfRating: true,
              itemSize: 18,
              itemBuilder: (context, _)=> Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating){
                print(rating);
              }
             ),
        
              SizedBox(height: 8),
        
              // /// Comment
              Text(
                review.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11),
              ),
              
              /// Name
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(review.image),
                  ),
                   SizedBox(width: 5),
                  Text(
                    review.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
        
             
            ],
          ),
        );
          }).toList(),
        
        )),
        SizedBox(height: 10,),
        Obx(()=> Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.reviews.length,
            (index)=> Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: controller.currentIndex.value == index? 8 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: controller.currentIndex.value == index 
                ? Colors.blue
                : Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ),
        ))
      ],
    );

  }
  
}