import 'package:flutter/material.dart';

class GoogleSignUp extends StatelessWidget{
  final void Function()? onPressed;
  const GoogleSignUp({
    super.key,
    this.onPressed
  });
  @override

  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed:onPressed,
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
        child : Container(
          padding: const EdgeInsets.all(11),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
            Container(
              padding : const EdgeInsets.only(right:20),
              child: Image.asset('assets/icons/google.png',
              height: 20,),
            ),
            const Text('Sign Up With Google',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 34, 37, 37),
            ),),
          ],)
        ),
      ); 
  }
} 