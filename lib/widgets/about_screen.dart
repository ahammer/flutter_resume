import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Container(width: double.infinity, height: double.infinity, color:Colors.black,
    child: Hero(tag:"about", child: Card(child:Text("blah"))),
    );
  }

}