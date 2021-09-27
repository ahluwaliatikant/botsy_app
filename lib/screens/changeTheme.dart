import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbot/constants.dart';
import 'package:theme_provider/theme_provider.dart';

class ChangeTheme extends StatefulWidget {
  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  List<String> themeNames = [
    "Orange",
    "Teal",
    "Blue",
    "Dark Teal",
    "Amber",
    "Indigo",
    "Dark Grey",
    "Dark Orange",
    "Red"
  ];

  List<String> themeIds = [
    "theme0",
    "theme1",
    "theme2",
    "theme3",
    "theme4",
    "theme5",
    "theme6",
    "theme7",
    "theme8",
  ];

  List<Color> themeColors = [
    Colors.orange,
    Colors.teal,
    Colors.blue,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
    Colors.grey,
    Colors.deepOrange,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: buttonBlack,
        title: Text(
          "Change Theme",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ThemeProvider.controllerOf(context).setTheme(themeIds[index]);
              setState(() {});
            },
            child: ListTile(
              trailing: ThemeProvider.themeOf(context).id == themeIds[index]
                  ? Icon(
                      Icons.check_circle,
                      color: buttonGreenColor,
                    )
                  : Container(width: 0, height: 0,),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeColors[index],
                ),
              ),
              title: Text(
                themeNames[index],
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: textGreenColor,
            thickness: 1,
          );
        },
        itemCount: themeNames.length,
      ),
    );
  }
}
