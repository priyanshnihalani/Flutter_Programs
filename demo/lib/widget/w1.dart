import 'package:flutter/material.dart';

class ButtonStyle1 extends StatelessWidget{
  final String nm;
  final Color? bgColor;
  final TextStyle? styles;
  final Icon? icon;
  ButtonStyle1({
    required this.nm,
    this.bgColor = Colors.indigoAccent,
    this.styles,
    this.icon
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: icon!=null? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon!,
        Container(
            width: 2,
            height: 0,
        ),
        Text(nm, style: styles)
      ],
    ):Text(nm, style: styles,),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: bgColor,
        shadowColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),);
  }

}