import 'package:flutter/material.dart';
import 'package:resume_flutter/screens/about/about_screen.dart';
import 'package:resume_flutter/transitions/fade_route.dart';



class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadiusDirectional.circular(12),            
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                "Adam Hammer",
                style: Theme.of(context).textTheme.display3,
              ),
              Text(
                "Flutter/Mobile",
                style: Theme.of(context).textTheme.display1,
              ),
              Container(
                height: 16,
              ),
            ],
          ),
        ),
      );
}
