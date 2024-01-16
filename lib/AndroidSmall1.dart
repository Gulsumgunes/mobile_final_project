

import 'package:flutter/material.dart';
import 'AndroidSmall2.dart';


// ignore: use_key_in_widget_constructors
class AndroidSmall1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 640,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(

            children: [
              // ignore: prefer_const_constructors
              Positioned(
                left: -27,
                top: 92,
                child: const SizedBox(
                  width: 414,
                  height: 98,
                  child: Text(
                    'SupplyNexa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0F5B7C),
                      fontSize: 48,
                      fontFamily: 'Keania One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 200,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/supplynexa.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 506,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AndroidSmall2()),
                    );
                  },
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 249,
                    height: 45,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 249,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: const Color.fromARGB(255, 32, 85, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 73,
                          top: 10,
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Color.fromARGB(255, 186, 218, 230),
                              fontSize: 20,
                              fontFamily: 'Ibarra Real Nova',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 150, // İstediğiniz konuma göre ayarlayabilirsiniz
                bottom: 10, // İstediğiniz konuma göre ayarlayabilirsiniz
                child: Text(
                  'by GEA',
                  style: TextStyle(
                    color: Colors.grey, // İstediğiniz rengi seçebilirsiniz
                    fontSize: 12, // İstediğiniz font büyüklüğünü seçebilirsiniz
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
