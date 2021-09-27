import 'package:testbot/models/field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateIntent {

  Future createIntent(String name , String projectID , List<Field> fields) async{

    List<Map<String,dynamic>> jsonFields = [];
    fields.forEach((element) {
      jsonFields.add(element.toJson());
    });

    print(jsonFields);

    try {
      var response = await http.post(
        Uri.parse("https://calm-beach-69260.herokuapp.com/api/intents/custom"),
        body: json.encode({
          "name": name,
          "projectID": projectID,
          "fields": jsonFields,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );

      print(response.statusCode);
      print(response.body);

      return true;
    }
    catch(e){
      print("CREATE INTENT FAILED");
      print(e);
      return false;
    }
  }

}