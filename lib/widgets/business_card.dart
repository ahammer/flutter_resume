import 'package:flutter/material.dart';

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
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("About"))), onPressed: () {})),
                  Container(width: 16),
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Resume"))), onPressed: () {})),
                ],
              )),
              Container(
                height: 16,
              ),
              Expanded(flex: 1, child: Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Github"))), onPressed: () {})),
                  Container(width: 16),
                  Expanded(child: RaisedButton(child: Container(height:double.infinity, child: Center(child: Text("Contact"))), onPressed: () {})),
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
