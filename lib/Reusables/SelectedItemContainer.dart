import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedItemContainer extends StatelessWidget {
  final double height , width;
  final String value ;
  final Function() OnPressed;
  const SelectedItemContainer({super.key, required this.height, required this.width, required this.value, required this.OnPressed});
  @override
  Widget build (BuildContext context){
    return Container(height: height,width:width,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 20,),
        Text(value,style: TextStyle(color: Colors.black),),
        IconButton(onPressed:OnPressed, icon:Icon(Icons.close)),
        SizedBox(width: 20,)
      ],),
    );
  }
}