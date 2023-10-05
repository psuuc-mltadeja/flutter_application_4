import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  TitleHome(
    this.startPlay_call, {
    super.key,
  });
  VoidCallback startPlay_call;
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment:CrossAxisAlignment.center ,
      children: [
        Image.asset('assets/images/home_back.jpg'),
        const SizedBox(height: 15),
        const Text(
          'Let us Start!',
          style: TextStyle(
              fontSize: 34, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: OutlinedButton(
              onPressed: startPlay_call,
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 40, 148, 244),
                  elevation: 5),
              child: const Text(
                'Play!',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
        )
      ],
    );
  }
}
