import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTaped;

  const Buttons(
      {Key? key, this.color, this.textColor, required this.buttonText, required this.buttonTaped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 4),  color: color,),
            
          
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Color.fromARGB(255, 255, 27, 251), fontSize: 40,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
