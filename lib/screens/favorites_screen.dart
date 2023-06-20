import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rent_a_car/common_widgets/image_slideshow.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Favorites"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             ImageSlideshow(
            isLoop: true,
            autoPlayInterval: 2000,
            initialPage: 0,
            height: MediaQuery.of(context).size.height - 400,
            children: [
              SlideShowCardWidget(
                carImage: "assets/car_images/honda_civic.jpg",
                carName: "Honda Civic",
                carModel: "2018",
                carFuel: "Petrol",
                carColor: "Black",
                carPrice: "Rs.1100 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/maruti_baleno.jpg",
                carName: "Maruti Suzuki Baleno",
                carModel: "2020",
                carFuel: "Diesel",
                carColor: "Blue",
                carPrice: "Rs.1000 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/nissan_patrol.jpg",
                carName: "Nissan Patrol",
                carModel: "2022",
                carFuel: "Diesel",
                carColor: "Gold",
                carPrice: "Rs.1800 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/ford_mustang.jpg",
                carName: "Ford Mustang",
                carModel: "2022",
                carFuel: "Diesel",
                carColor: "Red",
                carPrice: "Rs.4500 per day",
              )
            ])
          ],
        ),
      ),
    );
  }
}