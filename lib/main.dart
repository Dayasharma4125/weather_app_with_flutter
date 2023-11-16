import 'package:flutter/material.dart';
import 'package:myapp/scaffold/wether_page.dart';
void main() {
  runApp(const Threejs());
}

class Threejs extends StatefulWidget {
  const Threejs({super.key});
  @override
  State<Threejs> createState() => _ThreejsState();
}

class _ThreejsState extends State<Threejs> {

  
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        home:WeatherPage()
        );  
  }
}
