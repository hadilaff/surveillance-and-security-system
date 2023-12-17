import 'package:flutter/material.dart';



class SplashPage extends StatelessWidget {
  //const SplashPage({super.key});
  final int duration;
  final Widget goToPage;
  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      //Navigator.push(
          //context, MaterialPageRoute(builder: (context) => goToPage));
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => goToPage));    
    });
    return Scaffold(
        body: Container(
      color: Color.fromARGB(249, 249, 249, 255),
      alignment: Alignment.center,
      child: Image.asset(
        'logo.jpg',
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      ),
      //const Icon(MyFlutterApp.photo, color: Colors.white, size: 200)
      // Container
      // Scaffold
    ));
  }
}
