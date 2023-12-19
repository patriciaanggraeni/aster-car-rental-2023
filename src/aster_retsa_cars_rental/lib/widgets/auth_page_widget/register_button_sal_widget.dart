import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../pages/register_page.dart';

class RegisterButton extends StatelessWidget {
  final String theText;
  const RegisterButton({
    super.key,
    required this.theText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        PageTransition(
           ctx: context,
           child: RegisterPage(),
           inheritTheme: true,
           alignment: Alignment.bottomCenter,
           duration: const Duration(milliseconds: 500),
           type: PageTransitionType.rightToLeft
        ),
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(
          color: Colors.grey.shade700, // Warna border
          width: 1.5, // Lebar border
        )),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            }
            return const Color.fromARGB(255, 34, 37, 37);
          },
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              theText,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
