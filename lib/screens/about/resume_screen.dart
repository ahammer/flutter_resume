import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: ResumeScreenBody());
}

//const kJobs = ["Mindquake", "AFSI", "Mirabel", "Atimi", "Tio", "PNI/Staples", "Realtor.com"];
final Map<String, WidgetBuilder> kJobExperienceWidgets = {
  "Realtor.com": (context) => JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Lorem ipsum dolar")),
  "PNI/Staples": (context) => Container(
      width: double.infinity, height: double.infinity, color: Colors.blueGrey),
  "Atimi": (context) => Container(
      width: double.infinity, height: double.infinity, color: Colors.blueGrey),
  "Mirabel": (context) => Container(
      width: double.infinity, height: double.infinity, color: Colors.blueGrey),
  "AFSI": (context) => Container(
      width: double.infinity, height: double.infinity, color: Colors.blueGrey),
  "MindQuake": (context) => Container(
      width: double.infinity, height: double.infinity, color: Colors.blueGrey),
};

class ResumeScreenBody extends StatefulWidget {
  const ResumeScreenBody({
    Key key,
  }) : super(key: key);

  @override
  _ResumeScreenBodyState createState() => _ResumeScreenBodyState();
}

class _ResumeScreenBodyState extends State<ResumeScreenBody> {
  String selected = "Realtor.com";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        ResumeNavigator(
          onClick: toggleOpened,
          selected: selected,
        ),
        Expanded(
          child: Stack(children: <Widget>[
            ...kJobExperienceWidgets.keys
                .map((job) => ContentPanel(
                    child: kJobExperienceWidgets[job](context),
                    opened: selected == job,
                    openOffset: 0,
                    closedOffset: -width,
                    width: width))
                .toList(),
          ]),
        ),
      ],
    );
  }

  void toggleOpened(String button) {
    setState(() {
      selected = button;
    });
  }
}

class ContentPanel extends StatelessWidget {
  const ContentPanel({
    Key key,
    @required this.opened,
    @required this.openOffset,
    @required this.closedOffset,
    @required this.width,
    @required this.child,
  }) : super(key: key);

  final bool opened;
  final double openOffset;
  final double closedOffset;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: AnimatedOpacity(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 600),
          opacity: opened ? 1 : 0,
          child: AnimatedContainer(
              child: child,
              curve: Curves.linearToEaseOut,
              transform: Transform.translate(
                      offset: Offset(opened ? openOffset : closedOffset, 0))
                  .transform,
              duration: const Duration(milliseconds: 1200),
              width: width)),
    );
  }
}

class ResumeNavigator extends StatelessWidget {
  final Function(String) onClick;
  final String selected;

  const ResumeNavigator({
    Key key,
    @required this.onClick,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryVariant,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          ...kJobExperienceWidgets.keys.map((hobby) => Container(
                child: RaisedButton(
                    color: (selected == hobby)
                        ? Theme.of(context).chipTheme.selectedColor
                        : Theme.of(context).chipTheme.disabledColor,
                    child: Text(
                      hobby,
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () => onClick(hobby)),
              )),
        ],
      ),
    );
  }
}

class Job {
  final String title;
  final String company;
  final DateTime startDate;
  final DateTime endDate;
  final String summary;
  final List<String> skills;
  final List<String> roles;
  final List<String> achievements;

  Job(
      {@required this.company,
      @required this.title,
      @required this.startDate,
      @required this.endDate,
      @required this.summary,
      @required this.skills,
      @required this.roles,
      @required this.achievements});
}

class JobDetails extends StatelessWidget {
  final Job job;
  
  JobDetails(this.job);


  @override
  Widget build(BuildContext context) => Card(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: JobDetailHeader(job: job)),
      ));
}

class JobDetailHeader extends StatelessWidget {
  final topRowHeight = 36.0;

  const JobDetailHeader({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Job job;  

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
    Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    alignment: FractionalOffset.bottomLeft,
                    child: Text(job.company,
                        style: Theme.of(context).textTheme.display1))),
            Expanded(
                child: Container(
                    height: topRowHeight,
                    alignment: FractionalOffset.bottomCenter,
                    child: Text(job.startDate.toString(),
                        style: Theme.of(context).textTheme.title))),
            Expanded(
                child: Container(
                    height: topRowHeight,
                    alignment: FractionalOffset.bottomRight,
                    child: Text(job.title,
                        style: Theme.of(context).textTheme.title))),
          ],
        )),
    Container(
      width: double.infinity,
      height: 2,
      color: Theme.of(context).colorScheme.onSurface,
    )
          ],
        );
  }
}
