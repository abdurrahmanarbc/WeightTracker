import 'package:flutter/material.dart';
import 'package:weight_tracking/settings_page.dart'; // Ayarlar sayfasını içeri aktarıyoruz

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 248, 242, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 40,
                    color: const Color.fromARGB(255, 110, 194, 111),
                  ),
                  onPressed: () {
                    // No action needed as you are already on the home page.
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.insert_drive_file,
                    size: 40,
                    color: const Color.fromARGB(255, 110, 194, 111),
                  ),
                  onPressed: () {
                    //When you click here, the actions to be taken will appear.
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.insert_chart,
                    size: 40,
                    color: const Color.fromARGB(255, 110, 194, 111),
                  ),
                  onPressed: () {
                    // When you click here, the actions to be taken will appear.
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                    color: const Color.fromARGB(255, 110, 194, 111),
                  ),
                  onPressed: () {
                    // When you press the settings icon, navigate to the settings page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildDataBox('Initial:', 'Initial Value'), // Starter box
              _buildDataBox('Goal:', 'Goal Value'), // Goal box
              _buildDataBox('Present:', 'Present Value'), // Present box
            ],
          ),
          SizedBox(height: 8.0), // Space
          ElevatedButton(
            onPressed: () {
              //Actions to be taken when pressing the add new weight button
            },
            child: Text('Add New Weight'),
          ),
          SizedBox(height: 16.0), // Space
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('given:'), // Given text
              Text('Remainder:'), // Remaining text
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataBox(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Add line around box
        borderRadius: BorderRadius.circular(8.0), // Round box corners
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(value),
        ],
      ),
    );
  }
}
