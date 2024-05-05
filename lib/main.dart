import 'package:flutter/material.dart';
import 'package:weight_tracking/SQLite/database_helper.dart';
import 'package:weight_tracking/home_page.dart';
import 'package:weight_tracking/login_page.dart';
import 'package:weight_tracking/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Necessary for running asynchronous code

  // Establish the database connection at the beginning of the application
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  
  dbHelper.initializeDatabase().then((_) {
    print('Database connection established');
    runApp(MyApp());
  }).catchError((error) {
    print('Error occurred while establishing database connection: $error');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {
        '/login': (context) => LoginPage(), 
        '/home': (context) => HomePage(), // Application screen route
        '/signup': (context) => SignUpPage(), // Route of the sign up screen
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracking App'),
        backgroundColor: Color.fromRGBO(249, 248, 242, 1),
titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Color.fromARGB(255, 110, 194, 111),
        ),
        centerTitle: true, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color.fromARGB(255, 110, 194, 111), 
      ),
      ),
      backgroundColor: Color.fromARGB(255, 186, 205, 182),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Weight Tracking App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'lib/assets/images/tarti.jpg',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Changed to center
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 110, 194,
                        111), // Change the color of the "Login" button
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Login'),
                ),
                SizedBox(width: 10), // Added spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 110, 194,
                        111), // Change the color of the "Login" button
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
