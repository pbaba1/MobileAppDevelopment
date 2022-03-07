## ChitChat App

Created a Web Application for users to chat. This application makes use of dart language and firebase, firestore, storage. Following are the files and their importance - 
* Chat-UserDetails
    All chat and user data related screens are developed and placed inside this folder. Following are the files inside this folder.
    * body_content.dart: This is the holder for the chats screen. Has a navigation at the bottom where user can navigate to Chats/Conversations screen, User Directory screen, USer Profile screen
    * chat_with_user.dart: This screen allows user to chat with the other user. User can initiate a chat here. If no chats present then a message is displayed.
    * chats.dart: This screen lists the users with whom the logged in user has had a chat with in descending order of the time the last message was sent along with the last message of the user.
    * user_directory.dart: This screen lists the users that are present in the application along with their ratings.
    * user_profile.dart: User can view own profile or other user's profile. The page layout is decided on the userID passed to this screen.
    
* Login-SignIn
    This folder consists of the registration, login, google signup/signin features, forgot password. Following are the files in the folder:- 
    * google_sign_in.dart: This file contains the logic to implement the goggle sign in feature
    * login.dart: This file helps user to login to the applicaiton. Also consits of logic for forgot password and logout.
    * register_user.dart: User registrtion logic is implemented here. Also user can uplaod profile picture while creating their account.

3. models
    This folder holds the model that is used on the chats screen
    a. chat_users_model.dart

4. services
    This holds the services that are used anywhere in the application
    a. constants.dart
    b. get_current_location.dart

5. Widgets
    This folder holds the widget that is used for creating a conversation list

6. main.dart - this is the entry point to the application

7. assets - This folder holds the images or any other assets that are used in the application.



















## Important References
# SHA - https://stackoverflow.com/questions/51845559/generate-sha-1-for-flutter-react-native-android-native-app
# Webapp run command - flutter run -d chrome --web-hostname localhost --web-port 5000
# Update App Logo - https://www.geeksforgeeks.org/flutter-changing-app-icon/
# Splash screen - https://pub.dev/packages/flutter_native_splash
# CORS issue resolution - https://stackoverflow.com/questions/65849071/flutter-firebase-storage-cors-issue
# Flutter Project Creation - flutter create --org com.<campusID> <AppName>

