import 'package:flutter/material.dart';
import 'package:my_time/widgets/my_button.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      childAspectRatio: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(20.0),
      children: [
        Text("Work", style: textStyle),
        const Text(""),
        const Text(""),
        const SettingsButton(color: Color(0xff455A64), text: "-", value: -1),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
        ),
        const SettingsButton(color: Color(0xff009688), text: "+", value: 1),
        // short break
        Text("Short", style: textStyle),
        const Text(""),
        const Text(""),
        const SettingsButton(color: Color(0xff455A64), text: "-", value: -1),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
        ),
        const SettingsButton(color: Color(0xff009688), text: "+", value: 1),
        // long break
        Text("Long", style: textStyle),
        const Text(""),
        const Text(""),
        const SettingsButton(color: Color(0xff455A64), text: "-", value: -1),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
        ),
        const SettingsButton(color: Color(0xff009688), text: "+", value: 1),
      ],
    );
  }
}
