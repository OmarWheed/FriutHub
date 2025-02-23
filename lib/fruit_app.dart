import 'package:flutter/material.dart';

//Start Point  App 

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _fruitAppBody(),
      ),
    );
  }
  //body 
  Widget _fruitAppBody() {
    return Center(
      child: Text("Fruit"),
    );
  }
}
