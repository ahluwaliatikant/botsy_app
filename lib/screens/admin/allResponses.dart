import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testbot/constants.dart';
import 'package:testbot/services/firestoreServices.dart';

class AllResponses extends StatelessWidget {

  String chatbotName;
  AllResponses({required this.chatbotName});

  @override
  Widget build(BuildContext context) {

    CollectionReference chatbot = FirebaseFirestore.instance.collection(chatbotName);

    return Scaffold(
      backgroundColor: backgroundBlack,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: buttonBlack,
        title: Text(
          "All Responses",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirestoreService().getAllResponses(chatbotName),
        builder:
            (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot == null) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
//            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            List listOfResponses = snapshot.data;
            return ListView.separated(
              itemBuilder: (context,index){
                String str = "";
                listOfResponses[index].forEach((key,value) {
                  str = str + "${key} - $value \n";
                });
                return ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "Reponse ${index+1}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    Text(
                      str,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: textGreenColor,
                  thickness: 1,
                );
              },
              itemCount: listOfResponses.length,
            );
          }

          return Center(child: CircularProgressIndicator(color: buttonGreenColor,));
        },
      ),
    );
  }
}
