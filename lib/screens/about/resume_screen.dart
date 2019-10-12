import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: ResumeScreenBody());
}

const kHobbies = ["Mindquake", "AFSI", "Mirabel", "Atimi", "Tio", "PNI/Staples", "Realtor.com"];

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
        AboutScreenSidebar(
          onClick: toggleOpened,
          selected: selected,
        ),
        Expanded(
          child: Stack(children: <Widget>[
            ...kHobbies.map((job)=>
            ContentPanel(
                opened: selected == kHobbies[0],
                openOffset: 0,
                closedOffset: -width,
                width: width)
            ).toList(),
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
  }) : super(key: key);

  final bool opened;
  final double openOffset;
  final double closedOffset;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: AnimatedOpacity(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 600),
          opacity: opened ? 1 : 0,
          child: AnimatedContainer(
            
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2, color: Theme.of(context).colorScheme.primaryVariant),
                
              ),
              curve: Curves.linearToEaseOut,
              transform: Transform.translate(
                      offset: Offset(opened ? openOffset : closedOffset, 0))
                  .transform,
              duration: const Duration(milliseconds: 1200),
              width: width)),
    );
  }
}

class AboutScreenSidebar extends StatelessWidget {
  final Function(String) onClick;
  final String selected;

  const AboutScreenSidebar({
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
          ...kHobbies.map((hobby) => Container(
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
