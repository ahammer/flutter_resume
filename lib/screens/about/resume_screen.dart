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
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),
  "PNI/Staples": (context) => JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),

  "Atimi": (context) => JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),

  "Mirabel": (context) =>JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),

  "AFSI": (context) =>JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),

  "MindQuake": (context) => JobDetails(Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary: "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion.")),

};

class ResumeScreenBody extends StatefulWidget {
  const ResumeScreenBody({
    Key key,
  }) : super(key: key);

  @override
  _ResumeScreenBodyState createState() => _ResumeScreenBodyState();
}

class _ResumeScreenBodyState extends State<ResumeScreenBody> {  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ContentPanel(
            child: kJobExperienceWidgets["Realtor.com"](context),
            opened: true,
            openOffset: 0,
            closedOffset: -width,
            width: width);
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
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            pinned: true,
            title: JobDetailHeader(job: job),
          ),
          SliverList(
            
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(24,0,16,0),
                child: Container(color: Theme.of(context).colorScheme.surface, child:Text("Summary", style: Theme.of(context).textTheme.title)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24,12,16,0),
                child: Container(color: Theme.of(context).colorScheme.surface, child:Text(job.summary)),
              ),
            
            ]),
          )
        ],
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
