import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Widget/drawer.dart';

class Welcome extends StatelessWidget {
  Welcome(this.email);
  final String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("FoodGuru"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome!!!!",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                Image.asset("images/foodguruwelcome.png"),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text("We will serve you delicious dishes of your choices",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            SizedBox(height: 20.0,),
            Center(
              child: CarouselSlider(
                items: [
                  Image.asset("images/dish1.jfif"),
                  Image.asset("images/dish2.jfif"),
                  Image.asset("images/dish3.jfif"),
                  Image.asset("images/dish4.jfif"),
                  Image.asset("images/dish5.jfif"),
                  Image.asset("images/dish6.jfif"),
                  Image.asset("images/dish7.jfif"),
                  Image.asset("images/dish8.jfif"),
                ],
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16/9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 2),

                ),
              ),
            ),
                Text("Thank You",style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
        drawer: MyDrawer("$email"),
      ),
    );
  }
}
