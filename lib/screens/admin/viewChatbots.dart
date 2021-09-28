import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/screens/admin/allResponses.dart';

class ViewChatbots extends StatelessWidget {
  String emailId;
  ViewChatbots({required this.emailId});

  @override
  Widget build(BuildContext context) {
    CollectionReference admins =
        FirebaseFirestore.instance.collection('adminToChatbot');

    return Scaffold(
      backgroundColor: backgroundBlack,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: buttonBlack,
        title: Text(
          "Your Chatbots",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: admins.doc(emailId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllResponses(
                                  chatbotName: data["chatbots"][index])));
                    },
                    child: ListTile(
                      title: Text(
                        data["chatbots"][index],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
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
              itemCount: data["chatbots"].length,
            );
          }

          return Center(child: CircularProgressIndicator(color: buttonGreenColor,));
        },
      ),
    );
  }
}
