import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue[200],
        child: Column(
          children: <Widget>[
            Image.asset(
                'assets/imgs/WhatsApp Image 2022-11-04 at 12.06.07 PM.jpeg'),
            Text(
              'job huntig',
              style: Theme.of(context).textTheme.headline1,
            ),
            // Text('made easy'),
          ],
        ),
      ),
    );
  }
}
