import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/screens/admin/addField.dart';
import 'package:testbot/services/firestoreServices.dart';
import 'package:testbot/widgets/customButton.dart';

class CreateBot extends StatelessWidget {
  final botNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final botNameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundBlack,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Create your Bot",
                  style: GoogleFonts.poppins(
                    color: textGreenColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Form(
              key: botNameFormKey,
              child: Column(
                children: [
                  TextFormField(
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
                        borderSide:
                            BorderSide(color: buttonGreenColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: botNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bot Name cannot be blank.';
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
                      hintText: "Bot Name",
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
                        borderSide:
                            BorderSide(color: buttonGreenColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "The above name will be used to invoke your chatbot.",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
                width: width,
                text: "Create Bot",
                onPressed: () async {
                  if (botNameFormKey.currentState!.validate()) {
                    await FirestoreService().addToAdminToChatbotsMapping(
                        botNameController.text, emailController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddField(
                                  intentName: botNameController.text,
                                )));
                  }
                },
                color: buttonGreenColor,
                textColor: Colors.white),
          ],
        ),
      )),
    );
  }
}
