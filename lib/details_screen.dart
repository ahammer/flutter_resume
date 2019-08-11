
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String asset;
  const DetailsScreen({Key key, this.title, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Hero(
        child: Center(
            child: Image.asset(
          asset,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        )),
        tag: asset,
      ),
      Column(
        children: <Widget>[
          Hero(
            tag: title,
            child: Card(
                color: Color.fromARGB(128, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                        Navigator.pop(context);
                      }),
                      Text(title,style: Theme.of(context).textTheme.display1),
                    ],
                  ),
                )),
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  child: Hero(
                      tag: "${title}_details",
                      child: Card(color: Color.fromARGB(128,0,0,0), child: Text("Details")))))
        ],
      )
    ]);
  }
}