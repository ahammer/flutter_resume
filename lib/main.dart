import 'package:flutter/material.dart';
import 'package:resume_flutter/screens/about/about_screen.dart';
import 'package:resume_flutter/screens/about/resume_screen.dart';
import 'package:resume_flutter/theme.dart';
import 'package:resume_flutter/transitions/fade_route.dart';

void main() => runApp(MyApp());

const kSections = ["About", "Resume"];

class MyApp extends StatelessWidget {
  final String currentTheme = "Light";
  final String currentSection = "About";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Adam Hammer',
        debugShowCheckedModeBanner: false,        
        theme: getTheme(currentTheme),
        home: MyPortfolioScaffold(route: "Resume", theme: "Light", child: ResumeScreen(),),        
        
        onGenerateRoute: (settings) {
          switch(settings.name) {
            case "/About" : 
              return FadeRoute(page: MyPortfolioScaffold(route: "About", theme: "Light", child: AboutScreen(),),        );
            case "/Resume" : 
              return FadeRoute(page: MyPortfolioScaffold(route: "Resume", theme: "Light", child: ResumeScreen(),),        );
            default:
              return FadeRoute(page:Container(child:Text("Empty")));
          }
        }, 

        );  
  }

    
}

class MyPortfolioScaffold extends StatelessWidget {
  final String route;
  final String theme;
  final Widget child;

  const MyPortfolioScaffold({
    Key key, this.route, this.theme, this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: MainScreenNavBar(
                selected: route,),
            actions: <Widget>[
            ],
          ),
          body: (child == null)?ResumeScreen():child);
  }
}


class MainScreenNavBar extends StatelessWidget {
  
  final String selected;

  const MainScreenNavBar({
    Key key,
    
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...kSections.map((job) => Container(
              child: RaisedButton(
                  color: (selected == job)
                      ? Theme.of(context).chipTheme.selectedColor
                      : Theme.of(context).chipTheme.disabledColor,
                  child: Text(
                    job,
                    style: Theme.of(context).textTheme.button,
                  ), onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/"+job);
                  },
                  ),
            )),
      ],
    );
  }
}
