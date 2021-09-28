import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  Future addToAdminToChatbotsMapping(String chatbotName , String emailID) async{

    //checking if this doc exists
    final snapshot = await FirebaseFirestore.instance.collection("adminToChatbot").doc(emailID).get();

    if(snapshot == null || !snapshot.exists){
      //the doc does not exist
      await FirebaseFirestore.instance.collection("adminToChatbot").doc(emailID).set({
        "chatbots": [chatbotName],
      });
    }
    else {
      //the doc already exists
      await FirebaseFirestore.instance.collection("adminToChatbot").doc(emailID).update({
        "chatbots": FieldValue.arrayUnion([chatbotName])
      });
    }
  }

  Future getAllResponses(String chatbotName) async{

    List myList = [];

    await FirebaseFirestore.instance
        .collection(chatbotName)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
          final data = doc.data();
          print(data);
          myList.add(data);
      });
    });

    print("MY LIST");
    print(myList);

    for(int i=0 ; i<myList.length ; i++){
      myList[i].forEach((key,value){
        print("Key = $key and Value = $value");
      });
    }

    return myList;

  }

}