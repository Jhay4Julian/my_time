import 'package:flutter/material.dart';
import 'package:my_time/widgets/my_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Work Timer'),
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
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Short Break',
                        onPressed: () {},
                        color: Colors.blueGrey,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Long Break',
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: CircularPercentIndicator(
                    radius: availableWidth / 3,
                    lineWidth: 10.0,
                    percent: 0.9,
                    center: Text(
                      "30:00",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    progressColor: const Color(0xFF009688),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MyButton(
                        title: 'Stop',
                        onPressed: () {},
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        title: 'Restart',
                        onPressed: () {},
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
