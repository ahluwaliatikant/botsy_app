import 'package:flutter/material.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/screens/admin/createBot.dart';
import 'package:testbot/screens/changeTheme.dart';
import 'package:testbot/screens/chatScreen.dart';
import 'package:testbot/screens/getName.dart';
import 'package:testbot/screens/welcome.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:testbot/screens/changeTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      //home: MyHomePage(title: "Botsy",),
//      home: WelcomeScreen(),
//    );
      return ThemeProvider(
        themes: [
          AppTheme(
              id: "theme0",
              data: ThemeData(
                primaryColor: Colors.orange,
                primarySwatch: Colors.orange,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme0"
          ),
          AppTheme(
              id: "theme1",
              data: ThemeData(
                primaryColor: Colors.teal,
                primarySwatch: Colors.teal,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme1"
          ),
          AppTheme(
              id: "theme2",
              data: ThemeData(
                primaryColor: Colors.blue,
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme2"
          ),
          AppTheme(
              id: "theme3",
              data: ThemeData(
                primaryColor: Colors.teal,
                primarySwatch: Colors.teal,
                scaffoldBackgroundColor: backgroundBlack,
                accentColor: Colors.white,
              ),
              description: "theme3"
          ),
          AppTheme(
              id: "theme4",
              data: ThemeData(
                primaryColor: Colors.amber,
                primarySwatch: Colors.amber,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme4"
          ),
          AppTheme(
              id: "theme5",
              data: ThemeData(
                primaryColor: Colors.indigo,
                primarySwatch: Colors.indigo,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme5"
          ),
          AppTheme(
              id: "theme6",
              data: ThemeData(
                primaryColor: Colors.grey,
                primarySwatch: Colors.grey,
                scaffoldBackgroundColor: backgroundBlack,
                accentColor: Colors.white,
              ),
              description: "theme6"
          ),
          AppTheme(
              id: "theme7",
              data: ThemeData(
                primaryColor: Colors.deepOrange,
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: backgroundBlack,
                accentColor: Colors.white,
              ),
              description: "theme7"
          ),
          AppTheme(
              id: "theme8",
              data: ThemeData(
                primaryColor: Colors.red,
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.white,
                accentColor: Colors.black,
              ),
              description: "theme8"
          ),
        ],
        child: ThemeConsumer(
          child: Builder(
            builder: (themeContext) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeProvider.themeOf(themeContext).data,
              title: "Botsy",
              home: Chat(),
            ),
          ),
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title??""),
        ),
        body: Center(
          child: Chat(),
        ),
    );
  }
}
