import 'package:flutter/material.dart';
import 'package:weight_tracking/app_page.dart';

class HomePage extends StatelessWidget {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
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
                    // When you press the settings icon, the actions to be taken will appear.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: AppPage(), 
    );
  }
}
