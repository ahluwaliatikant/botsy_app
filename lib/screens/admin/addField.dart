import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/models/field.dart';
import 'package:testbot/services/createIntent.dart';
import 'package:testbot/widgets/customButton.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddField extends StatefulWidget {
  String intentName;

  AddField({required this.intentName});

  @override
  _AddFieldState createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  final fieldController = new TextEditingController();
  final fieldFormKey = GlobalKey<FormState>();
  String selectedType = "First Name";
  List<Field> fields = [];

  List<String> types = [
    "First Name",
    "Last Name",
    "Date",
    "URL",
    "Long Number",
    "Integer"
  ];

  List<DropdownMenuItem<String>> generateDropdownItems(List<String> myList) {
    print(types);

    List<DropdownMenuItem<String>> ans = [];
    myList.forEach((element) {
      ans.add(DropdownMenuItem<String>(value: element, child: Text(element , style: GoogleFonts.poppins(color: Colors.white),)));
    });

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return LoaderOverlay(
      child: Scaffold(
        backgroundColor: backgroundBlack,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Add A Field",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Form(
                  key: fieldFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fieldController,
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
                          hintText: "Field Name",
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
                        height: 12,
                      ),
                      Container(
                        width: width*0.9,
                        child: DropdownButton(
                          dropdownColor: textGreenColor,
                          value: selectedType,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: buttonGreenColor,
                          ),
                          items: generateDropdownItems(types),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedType = newValue ?? "";
                            });
                          },
                          underline: Container(
                            height: 2,
                            color: buttonGreenColor,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CustomButton(
                      width: width,
                      text: "Add Field",
                      onPressed: () {
                        if(fieldFormKey.currentState!.validate()){
                          Field newField = new Field(
                              name: fieldController.text, type: selectedType);
                          fields.add(newField);
                          setState(() {
                            fieldController.text = "";
                          });
                        }
                      },
                      color: buttonGreenColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      width: width,
                      text: "Finish Chatbot",
                      onPressed: () async {
                        context.loaderOverlay.show();
                        await CreateIntent()
                            .createIntent(widget.intentName, projectID, fields);
                        context.loaderOverlay.hide();
                      },
                      color: buttonGreenColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
