import 'package:flutter/material.dart';
import 'package:my_time/models/timer_model.dart';
import 'package:my_time/screens/settings_screen.dart';
import 'package:my_time/timer.dart';
import 'package:my_time/widgets/my_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountDownTimer timer = CountDownTimer();

  void goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = [];
    menuItems
        .add(const PopupMenuItem(value: 'Settings', child: Text('Settings')));
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Work Timer'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return menuItems.toList();
            },
            onSelected: (s) {
              if (s == 'Settings') {
                goToSettings(context);
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MyButton(
                        title: 'Work',
                        onPressed: () => timer.startWork(),
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Short Break',
                        onPressed: () => timer.startBreak(true),
                        color: Colors.blueGrey,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Long Break',
                        onPressed: () => timer.startBreak(false),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  initialData: '00:00',
                  stream: timer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timer = (snapshot.data == '00:00')
                        ? TimerModel('00:00', 1)
                        : snapshot.data;
                    return Expanded(
                      child: CircularPercentIndicator(
                        radius: availableWidth / 3,
                        lineWidth: 10.0,
                        percent: timer.percent,
                        center: Text(
                          timer.time,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        progressColor: timer.percent <= 0.1
                            ? Colors.red
                            : const Color(0xFF009688),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MyButton(
                        title: 'Stop',
                        onPressed: () => timer.stopTimer(),
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Restart',
                        onPressed: () => timer.startTimer(),
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
