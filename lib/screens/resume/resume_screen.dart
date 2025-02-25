import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_flutter/theme.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: ResumeScreenBody());
}
final formatter = DateFormat('MM/yyyy');
final Map<String, Job> kJobExperienceWidgets = {
  "Realtor.com": Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: [
        "Worked primarily on Realtor.com android",
        "Championed flutter migration",
        "Championed instant app implementation",
        "Designed analytics frameworks",
        "Designed search frameworks",
        "Designed testing frameworks",
        "Managed CI processes (Jenkins/Github)",
        "Integrated 3rd party software",
        "Migrated Legacy to Retrofit",
        "Redesigned Details Screen Architecture",
        "Deployed Instant App",
        "Detangled large sections of monolithic codebase",
        "Helped refine Agile and Team processes",
        "Provided support for team members",
        "Handled co-op hiring and interview process",
      ],
      roles: [],
      endDate: DateTime.now(),
      startDate: DateTime.utc(2015, DateTime.may),
      skills: <String>[
        "Android",
        "Flutter",
        "Java",
        "Kotlin",
        "RxJava",
        "RetroFit",
        "Analytics",
        "Architecture",
        "Jenkins",
        "Jira"
      ],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives "
          "(Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend "
          "frameworks). Much of my time was spent building frameworks and "
          "groundwork for projects and following them through to completion."),

          
  "Metal Rain": Job(
      company: "Metal Rain Studios",
      title: "Founder/Developer",
      achievements: [
        "Published Metal Rain - 3D Tank Game",
        "Published White Collar Crime Simulator - Stock Simulator Game",
        "Published 25+ additional small games and app",         
        "Built MySaasa, a white labeling CMS system", 
        ],
      endDate: DateTime.now(),
      startDate: DateTime.utc(2010, DateTime.june),
      roles: <String>["a", "b", "c"],
      skills: <String>["Android", "Java", "Kotlin", "Flutter", "OpenGL", "LibGDX", "Unreal Engine", "Wicket", "Jira"],
      summary:
          "Indie gaming and project work. Various projects taken over the years."),



  "PNI": Job(
      company: "Pni",
      title: "Senior Android Developer",
      achievements: [
"Implemented Gradle and Automated test system",
"Architected and Redesigned rewrite of code to bring stability to the platform",
"Worked on the following brands (Costco, Walmart, Tesco)",
        ],
      endDate: DateTime.utc(2014, DateTime.october),
      startDate: DateTime.utc(2013, DateTime.december),
      roles: <String>["a", "b", "c"],
      skills: <String>["Java", "Android", "Jira"],
      summary:
          "While at Pni, I used my experience to improve their platform and tools, and help implement"
          "new products on their platform"),



  "Tio": Job(
      company: "Tio Networks",
      title: "Senior Mobile Engineer",
      achievements: ["Developed TioMobilePay (android)", "Deployed (PG&E, Mobilicity, El Paso Electric, TioMobilePay) branded versions.", "Branded C# Payment Kiosk"],
      endDate: DateTime.utc(2013, DateTime.december),
      startDate: DateTime.utc(2011, DateTime.december),      
      roles: <String>["a", "b", "c"],
      skills: <String>["Android", "Java", ".NET", "Jira"],
      summary:
          "Helped build and deliver the Android version of Tio&#39;s mobile pay framework. This software"
          "vertical allows bill-payment in a generic app, as well as client-branded bill payment"
          "applications"),


/*
Atimi Software, Vancouver 12/2010 – 10/2011
Senior Android Developer
 Engineer and Architect of the Atimi Mobile Sport Framework Atimi Sports Framework
Apps.
 In 8 months we developed Applications for the following sports teams:
o Version 1.x: Canucks, Blackhawks, Flames
o Version 2.0: Senators, Lions
o Pending Release: Rangers, Canadiens
 Lead a team of varying size up to 4 developers.
 Optimized and improved company processes
*/

  "Atimi": Job(
      company: "Atimi Software",
      title: "Staff Engineer",
      achievements: ["Deleveloped Atimi Mobile Sports Framework", "Developed Canucks, Blackhawks, Flames, Senators, Lions, Rangers and Canadiens apps", "Led a team of 4 developers", "Optimized development processes"],
      endDate:DateTime.utc(2010, DateTime.december),
      startDate: DateTime.utc(2011, DateTime.october),
      roles: <String>["a", "b", "c"],
      skills: <String>["Android", "Java", "Jira"],
      summary:
          "Senior Android Engineer. Developed mobile sports framework and deployed numerous brandings."),
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
    final List<Widget> slivers = List();
    kJobExperienceWidgets.values
        .map((job) => getJobDetailSlivers(context, job))
        .forEach((it) => slivers.addAll(it));

    return ContentPanel(
        child: Card(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
            child: CustomScrollView(slivers: slivers)),
        opened: true,
        openOffset: 0,
        closedOffset: -width,
        width: width);
  }

  List<Widget> getJobDetailSlivers(BuildContext context, Job job) => <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(height: 12),
            JobDetailHeader(job: job),
            JobSummaryWidget(job: job),
            JobSkillsWidget(
              job: job,
            ),
            AchiementsWidget(job: job),
            Container(height:24),
          ]),
        )
      ];
}

class AchiementsWidget extends StatelessWidget {
  final Job job;
  const AchiementsWidget({
    Key key,
    this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
            (job.achievements
                .fold<String>(
                    "Achievements: \n", (ret, job) => ret += ">    $job\n")
                .trim()),
            style: Theme.of(context).textTheme.body1.copyWith(
                fontFamily: kDefaultFont,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
        alignment: FractionalOffset.topLeft,
      ),
    );
  }
}

class JobSummaryWidget extends StatelessWidget {
  final Job job;
  const JobSummaryWidget({
    Key key,
    this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
      child: Container(
          child: Text(
        job.summary,
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontFamily: kDefaultFont),
      )),
    );
  }
}

class JobSkillsWidget extends StatelessWidget {
  final Job job;

  const JobSkillsWidget({
    Key key,
    this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
          width: 120,
          decoration: BoxDecoration(                            
              
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (job.skills
                  .fold<String>("", (ret, job) => ret += "$job  ")
                  .trim()),
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: kDefaultFont,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
          )),
    );
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
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: AnimatedOpacity(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 600),
          opacity: opened ? 0.9 : 0,
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
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                    flex: 10,
                    child: Container(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(job.company,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 18,
                                fontFamily: kDefaultFont,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7))))),
                Expanded(
                    flex: 10,
                    child: Container(
                        height: 18,
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(formatter.format(job.startDate) + " to " + formatter.format(job.endDate),
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 12, fontFamily: kDefaultFont)))),
                Expanded(
                    flex: 10,
                    child: Container(
                        height: 18,
                        alignment: FractionalOffset.bottomRight,
                        child: Text(job.title,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 12, fontFamily: kDefaultFont)))),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Container(
            width: double.infinity,
            height: 2,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        )
      ],
    );
  }
}
