import 'package:flutter/material.dart';

class UpperLogo extends StatelessWidget{
  const UpperLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(0),
    child: Column(children: [
              Container(
                margin: const EdgeInsets.only(right:100),
                child: const Text('aster',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Zeniq',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left:100),
                child: const Text('retsa',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Zeniq',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),              
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'Dreams ', 
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Cars, ', 
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Real ', 
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  'Journeys', 
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],)
    ]),
    );
  }
}