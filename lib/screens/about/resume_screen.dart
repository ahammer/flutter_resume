import 'package:flutter/material.dart';
import 'package:resume_flutter/theme.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: ResumeScreenBody());
}

//const kJobs = ["Mindquake", "AFSI", "Mirabel", "Atimi", "Tio", "PNI/Staples", "Realtor.com"];
final Map<String, Job> kJobExperienceWidgets = {
  "Realtor.com": Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: [
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
      startDate: DateTime.now(),
      skills: <String>[
        "Android",
        "Flutter",
        "Java",
        "Kotlin",
        "RxJava",
        "RetroFit",
        "Analytics",
        "Architecture"
      ],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
  "PNI/Staples": Job(
      company: "Realtor.com1",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
  "Atimi": Job(
      company: "Realtor.com2",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
  "Mirabel": Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
  "AFSI": Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
  "MindQuake": Job(
      company: "Realtor.com",
      title: "Staff Engineer",
      achievements: ["a", "b", "c"],
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      roles: <String>["a", "b", "c"],
      skills: <String>["a", "b", "c"],
      summary:
          "Staff Engineer on the Mobile teams. Spearheaded many initiatives (Retrofit, RxJava, Flutter, Kotlin, Analytics, Frontend & Backend frameworks). Much of my time was spent building frameworks and groundwork for projects and following them through to completion."),
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
      padding: const EdgeInsets.all(16.0),
      child: Container(
          width: 120,
          decoration: BoxDecoration(
              border: Border.all(),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3, offset: Offset(2, 2), color: Colors.black)
              ],
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
                                fontSize: 22,
                                fontFamily: kDefaultFont,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7))))),
                Expanded(
                    flex: 10,
                    child: Container(
                        height: 22,
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(job.startDate.toString(),
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 12, fontFamily: kDefaultFont)))),
                Expanded(
                    flex: 10,
                    child: Container(
                        height: 22,
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
