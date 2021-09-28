import 'package:flutter/material.dart';
import 'package:testbot/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbot/screens/admin/viewChatbots.dart';
import 'package:testbot/widgets/customButton.dart';

class EnterEmail extends StatelessWidget {
  final emailController = new TextEditingController();
  final emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundBlack,
        appBar: AppBar(
          backgroundColor: backgroundBlack,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Enter Your Email ID",
                style: GoogleFonts.poppins(
                  color: textGreenColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Form(
                key: emailFormKey,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email ID cannot be blank.';
                    }
                    return null;
                  },
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Email ID",
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: buttonGreenColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: buttonGreenColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              CustomButton(
                width: width,
                text: "Next",
                onPressed: () {
                  if(emailFormKey.currentState!.validate()){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewChatbots(emailId: emailController.text,)));
                  }
                },
                color: buttonGreenColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
