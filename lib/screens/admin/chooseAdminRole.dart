import 'package:flutter/material.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/screens/admin/createBot.dart';
import 'package:testbot/screens/admin/enterEmail.dart';
import 'package:testbot/screens/chatScreen.dart';
import 'package:testbot/widgets/customButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseAdminRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundBlack,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hi Admin !",
                style: GoogleFonts.poppins(
                  color: textGreenColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SvgPicture.asset(
                "assets/images/admin.svg",
                width: width*0.7,
              ),
              Column(
                children: [
                  Text(
                    "Do you want to:",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    width: width,
                    text: "Create A Chatbot",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBot()));
                    },
                    color: buttonGreenColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    width: width,
                    text: "View Responses",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EnterEmail()));
                    },
                    color: buttonGreenColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
