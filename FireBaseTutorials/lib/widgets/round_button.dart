import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String data;
  final VoidCallback press;
  const RoundButton({super.key, required this.data, required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(12)
        ),
        height: 50,
        child: Center(child: Text(data, style: TextStyle(fontSize: 24, color: Colors.white),)),
      ),
    );
  }
}
