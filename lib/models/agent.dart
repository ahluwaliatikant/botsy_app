import 'package:flutter/cupertino.dart';

class Agent {
  String? name;
  String? projectID;
  String? defaultLanguageCode;

  Agent({
    @required this.name,
    @required this.projectID,
  });

  factory Agent.fromJson(Map<String,dynamic> json){
    return Agent(
      name: json["name"],
      projectID: json["projectID"],
    );
  }

  Map<String,dynamic> toJson (){
    return {
      "name": name,
      "peojectID": projectID,
    };
  }
}