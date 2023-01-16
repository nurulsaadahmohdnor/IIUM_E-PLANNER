import 'package:flutter/material.dart';
import 'package:schedule/pages/home_page.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromRGBO(81, 40, 85, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ), //IconButton
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
       
            tiles: <SettingsTile>[
       

              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: false,
                leading: Icon(Icons.notifications),
                title: Text('Notification'),
              ),

      
            ],
          ),
        ],
      ),
    );
  }
}
