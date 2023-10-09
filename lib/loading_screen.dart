import 'package:flutter/material.dart';
import 'package:tempo_app/home_screen.dart';

class LoadingScreen extends StatelessWidget {
  static String id = 'LoadingScreen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 165, 144),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'assets/img/logo.png',
                  width: 500,
                  height: 300,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Tempo-UTT",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
