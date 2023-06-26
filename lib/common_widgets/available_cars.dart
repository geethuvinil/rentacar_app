import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/common_widgets/image_slideshow.dart';
import 'package:rent_a_car/screens/car_details_screen.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({super.key});

  @override
  State<AvailableCars> createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "Now Available",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        ImageSlideshow(
            isLoop: true,
            autoPlayInterval: 2000,
            initialPage: 0,
            height: MediaQuery.of(context).size.height - 400,
            children: [
              SlideShowCardWidget(
                carImage: "assets/car_images/bmw_i7.jpg",
                carName: "BMW series 7",
                carModel: "2022",
                carFuel: "Diesel",
                carColor: "Black",
                carPrice: "Rs.10000 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/toyota_innova.jpg",
                carName: "Toyota Innova",
                carModel: "2019",
                carFuel: "Petrol",
                carColor: "White",
                carPrice: "Rs.3000 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/chevrolet_impala.jpg",
                carName: "Chevrolet Impala",
                carModel: "2021",
                carFuel: "Diesel",
                carColor: "Black",
                carPrice: "Rs.8500 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/hyundai_elentra.jpg",
                carName: "Hyundai Elentra",
                carModel: "2020",
                carFuel: "Petrol",
                carColor: "Blue",
                carPrice: "Rs.4500 per day",
              )
            ])
      ],
    );
  }
}