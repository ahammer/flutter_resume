import 'package:flutter/material.dart';
import 'package:resume_flutter/details_screen.dart';
import 'package:resume_flutter/main.dart';

class ResumeEntry {
  final String company;
  final DateTime startDate;
  final DateTime endDate;
  final String jobTitle;
  final List<String> achievements;

  ResumeEntry(this.company, this.startDate, this.endDate, this.jobTitle,
      this.achievements);
}

final List<ResumeEntry> resume = [
  ResumeEntry("Realtor.com", DateTime.now(), DateTime.now(), "jobTitle",
      ["Realtor.com", "did something else"]),
  ResumeEntry("PNI Digital Media", DateTime.now(), DateTime.now(), "jobTitle",
      ["PNI Digital Media", "did something else"]),
  ResumeEntry("Tio Digital Networks", DateTime.now(), DateTime.now(), "jobTitle",
      ["did something", "did something else"]),
  ResumeEntry("Atimi Software", DateTime.now(), DateTime.now(), "jobTitle",
      ["did something", "did something else"]),
  ResumeEntry("Siberra", DateTime.now(), DateTime.now(), "jobTitle",
      ["did something", "did something else"]),
  ResumeEntry("Tio Digital Galleries", DateTime.now(), DateTime.now(), "jobTitle",
      ["did something", "did something else"])
];

class ResumeScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
          body: DetailsScreen(
        title: "Experience",
        asset: "assets/bg2.jpg",
        body: ListView.builder(
            itemCount: resume.length,
            itemBuilder: (context, index) =>
                ResumeEntryWidget(entry: resume[index])),
      ));
}

class ResumeEntryWidget extends StatelessWidget {
  final ResumeEntry entry;

  const ResumeEntryWidget({Key key, this.entry}) : super(key: key);

  Widget build(BuildContext context) => Card(
    child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(entry.company, style: Theme.of(context).textTheme.headline),
                  Spacer(),
                  Text("${entry.startDate.toString()} - ${entry.endDate.toString()}"),
                  
                ],
              ),
             Row(
               children: <Widget>[
                 Text(entry.jobTitle),
               ],
             )],
          )
        ),
  );
}
