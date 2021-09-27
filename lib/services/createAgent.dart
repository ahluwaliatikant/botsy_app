import 'package:testbot/constants.dart';
import 'package:testbot/models/agent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAgent {
//  Future createAgent(Agent agent) async{
//    var response = await http.post(
//      Uri.parse("https://dialogflow.googleapis.com/v2/%5BPARENT%5D/agent?key=$apiKey HTTP/1.1"),
//      headers: {
//        "Accept": "application/json",
//        "Content-Type": "application/json",
//      },
//      body: json.encode(agent.toJson(agent))
//    );
//
//    print(response.statusCode);
//    print(response.body);
//
//  }

  Future createAgent(Agent agent) async {
    var response = await http.post(
      Uri.parse(""),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: json.encode(agent.toJson()),
    );

    print("STATUS CODE: ${response.statusCode}");
    print("BODY: ${response.body}");
  }
}
