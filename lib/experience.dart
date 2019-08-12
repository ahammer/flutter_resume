import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_flutter/details_screen.dart';
import 'package:resume_flutter/main.dart';

final dateFormat = DateFormat("MMM yyyy");

class ResumeEntry {
  final String company;
  final DateTime startDate;
  final DateTime endDate;
  final String jobTitle;
  final List<String> achievements;

  ResumeEntry(this.company, this.startDate, this.endDate, this.jobTitle,
      this.achievements);

  String lengthString() {
    final timeMs =
        endDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    final timeMonths = ((timeMs / 2629746000) % 12).toInt();
    final timeYears = ((timeMs / 2629746000) / 12).toInt();

    if (timeYears == 0) {
      return "$timeMonths Months";
    } else if (timeMonths == 0) {
      return "$timeYears Years";
    }
    return "$timeYears Years $timeMonths Months";
  }
}

final List<ResumeEntry> resume = [
  ResumeEntry(
      "Realtor.com", DateTime(2015, 5), DateTime.now(), "Staff Engineer", [
    "Created Flutter based framework for Realtor.com IOS/Android apps",
    "Maintained Realtor.com Android App",
    "Spearheaded large-scale projects within the team",
    "Developed Instant-App",
    "Helped drive a large improvement in customer satisfation"
  ]),
  ResumeEntry("Metal Rain Studios", DateTime(2010, 6), DateTime.now(),
      "Founder/Developer", [
    "Developed open source CMS (MySaasa)",
    "Published independent games",
    "Published dozens of small utilities and app"
  ]),
  ResumeEntry("PNI Digital Media", DateTime(2013, 11), DateTime(2014, 10),
      "Senior Android Developer", [
    "Reduced bugs and increased stability of production application",
    "Improved structure and processes of the team",
    "Introduced CI and Testing framework"
  ]),
  ResumeEntry("TIO Networks", DateTime(2011, 11), DateTime(2013, 11),
      "Senior Android Developer", [
    "Developed TIO Mobile BillPay",
    "Deployed branded solutions of the BillPay platform",
    "Help lead the company towards Agile Development"
  ]),
  ResumeEntry("Atimi Software", DateTime(2010, 12), DateTime(2011, 10),
      "Senior Android Developer", [
    "Lead Developer of the Mobile Sports Framework",
    "Deployed apps for the Canucks, Lions and many more NHL and CFL teams"
  ]),
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

  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(entry.company, style: Theme.of(context).textTheme.headline),
              Spacer(),
              Text(
                  "${dateFormat.format(entry.startDate)} - ${dateFormat.format(entry.endDate)}"),
            ],
          ),
          Row(
            children: <Widget>[
              Text(entry.jobTitle),
              Spacer(),
              Text(entry.lengthString())
            ],
          ),
          Container(height: 8),
          ...entry.achievements.map((achievement) => Row(
                children: <Widget>[
                  Icon(Icons.arrow_right),
                  Text(achievement),
                ],
              ))
        ],
      ));
}
