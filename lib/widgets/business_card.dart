import 'package:flutter/material.dart';
import 'package:resume_flutter/transitions/fade_route.dart';
import 'package:resume_flutter/widgets/about_screen.dart';

const kCardWidth = 320.0;
const kCardHeight = 320.0;

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: kCardWidth,
        height: kCardHeight,
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
              Expanded(flex: 1, child: Row(
                children: <Widget>[
                  Expanded(child: Hero(tag: "about",
                                      child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("About"))), onPressed: () {
                      Navigator.of(context).push(FadeRoute(page: AboutScreen()));
                    }),
                  )),
                  Container(width: 16),
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Resume"))), onPressed: () {
                    Navigator.of(context).push(FadeRoute(page: AboutScreen()));
                  })),
                ],
              )),
              Container(
                height: 16,
              ),
              Expanded(flex: 1, child: Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Github"))), onPressed: () {
                    Navigator.of(context).push(FadeRoute(page: AboutScreen()));
                  })),
                  Container(width: 16),
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Contact"))), onPressed: () {
                    Navigator.of(context).push(FadeRoute(page: AboutScreen()));
                  })),
                ],
              )),
              Container(
                height: 16,
              ),
            ],
          ),
        ),
      );
}
