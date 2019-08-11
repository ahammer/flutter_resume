
import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String asset;
  final String route;

  const HomeScreenCard({Key key, this.title, this.asset, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Stack(children: [
        Hero(
          child: Center(
              child: Image.asset(
            asset,
            fit: BoxFit.cover,
            height: 320,
            width:double.infinity
            
          )),
          tag: asset,
        ),
        Hero(
          tag: title,
          child: Card(
              color: Color.fromARGB(128, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Text(title, style: Theme.of(context).textTheme.display1),
              )),
        )
      ,
       Hero(tag:"${title}_details", child:Card(color: Color.fromARGB(0,0,0,0), ))]),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}