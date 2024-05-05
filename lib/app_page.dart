import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
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
