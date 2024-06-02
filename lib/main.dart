import 'package:flutter/material.dart';
import 'package:weight_tracking/SQLite/database_helper.dart';
import 'package:weight_tracking/login_page.dart';
import 'package:weight_tracking/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  final String fileName =
      'your_database.db'; // Veritabanı dosya adını buraya ekleyin
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  dbHelper.initializeDatabase(fileName).then((_) {
    print('Database connection established');
    runApp(MyApp());
  }).catchError((error) {
    print('Error occurred while establishing database connection: $error');
  });
}

class MyApp extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(dbHelper: dbHelper),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 110, 194, 111),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Login'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 110, 194, 111),
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
