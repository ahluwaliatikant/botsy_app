import 'package:flutter/material.dart';

class CreateAgent extends StatelessWidget {
  final nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Create An Agent"),
            TextFormField(
              controller: nameController,
            ),
            TextButton(
                onPressed: (){
                  //TODO call create agent function
                },
                child: Text("Create")
            ),
          ],
        ),
      ),
    );
  }
}
