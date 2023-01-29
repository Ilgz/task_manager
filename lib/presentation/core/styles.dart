import 'package:flutter/material.dart';

class Styles{
  //static const primaryColor=Colors.red;
 // Color.fromARGB(255, 123, 0, 245)
  static TextStyle? titleStyle(context)=>Theme.of(context).textTheme.headlineMedium?.copyWith(color:Colors.black);
  static TextStyle? headerStyle(context)=>Theme.of(context).textTheme.titleLarge?.copyWith(color:Colors.black);
  static TextStyle? bodyStyle(context)=>Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.black);
  static const TextStyle buttonStyle=TextStyle(
      fontSize: 16,
      color:Colors.white,
      fontWeight: FontWeight.w500
  );

}