import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/homepage.dart';
import 'package:restaurant_app/screens/menupage.dart';
import 'package:restaurant_app/screens/dish_detail_screen.dart';

void main() {
  runApp( MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //damit dieses debug nicht da ist!
      home: Homepage(),
      
      //how to handle navigation!!
      routes: {
        '/homepage' :(context)=> Homepage(),
        '/menupage' :(context)=> Menupage(),
        '/dish_detail': (context) => DishDetailScreen(),
      }
    );
  }
}