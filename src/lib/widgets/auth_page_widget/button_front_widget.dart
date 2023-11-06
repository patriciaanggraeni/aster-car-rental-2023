import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ButtonFront extends StatelessWidget {
  final String theText;
  final Widget toPage;

  const ButtonFront({
    super.key,
    required this.theText,
    required this.toPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
              ctx: context,
              child: toPage,
              inheritTheme: true,
              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.rightToLeft
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            }
            return Colors.white;
          },
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(theText,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 34, 37, 37),
                )),
          ],
        ),
      ),
    );
  }
}
