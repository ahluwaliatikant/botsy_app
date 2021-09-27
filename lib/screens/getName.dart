import 'package:flutter/material.dart';
import 'package:testbot/models/agent.dart';
import 'package:testbot/services/createAgent.dart';
class GetProjectName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameController = new TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Center(
                child: TextFormField(
                  controller: nameController,
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  //Agent agent = new Agent(name: nameController.text, parent: "projects/eventory-a4443", defaultLanguageCode: "en");
                  //CreateAgent().createAgent(agent);
                },
                child: Text("Send")
            ),
          ],
        ),
      ),
    );
  }
}

