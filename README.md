# Botsy
## Introduction
Botsy is a multipurpose Chatbot. It can handle multiple scenarios and can replace the monotonous forms on our websites.

## Features
- Admins can create Chatbots right from the app by specifying the fields and their data types.
- Users can interact with the chatbot by typing messages and also through voice commands.
- The theme of the chat screen can be changed. It supports multiple dark and light themes.
- Admins can view all Chatbots created by them and all responses for each chatbot, right within the app.

## Built With -
- Frontend - Flutter & Dart
- Backend - NodeJS
- Database - Firebase Cloud Firestore
- Dialogflow API

## How It Works ?
- Every time an Admin tries to create a chatbot, a request is made to our NodeJS server which uses the Dialogflow library to create new Intents in our Dialogflow agent matching the fields entered.
- When the user types messages our uses voice commands to interact with the bot, Dialogflow finds the matching intent in our agent. If no matching intent is there the Default fallback intent is called.
- If a matching intent is found Dialogflow accepts the user entry and makes a call to our webhook service ( Webhook service is deployed by us on Heroku through which Dialogflow can interact with our server to generate dynamic responses and to store the valid user entries in the database. ). The responses generated from the service are then sent to the user.
- Validation - If the user enters a value for a field that does not match its data type Dialogflow would not accept it and ask the user to Enter it again. In the future, we plan to add more custom validation to the entries in our chatbot.

## Screenshots

| Welcome Screen    | Admin Dashboard   | Chat Screen (Light)    |
|-------------------|-----------------|------------------------|
| ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/welcome.png) | ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/admin.png) | ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/chatOrange.png) |

| Change Theme   | View Responses        | Create Bot        |
|----------------------------------|-----------------|-----------------|
| ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/changeThemeGif.gif) | ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/createBot.png) | ![](https://github.com/ahluwaliatikant/botsy_app/blob/voice/assets/screenshots/viewResponses.png) |
