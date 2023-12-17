import 'package:flutter/material.dart';
import 'package:mp_task_9/component/made_by.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../component/countdown_timer.dart';
import '../model/timermodel.dart';
import 'settings.dart';

class TimerHomePage extends StatelessWidget {
  TimerHomePage({Key? key}) : super(key: key);

  final CountDownTimer countdownTimer = CountDownTimer();

  void gotoSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = <PopupMenuItem<String>>[];
    menuItems.add(
      const PopupMenuItem(
        value: 'Settings',
        child: Text('Pengaturan'),
      ),
    );
    countdownTimer.startWork();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Pengatur Waktu Produktivitas'),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return menuItems.toList();
            },
            onSelected: (selected) {
              if (selected == 'Settings') {
                gotoSettings(context);
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        final double availableWidth =
            (constraint.maxWidth < constraint.maxHeight)
                ? constraint.maxWidth
                : constraint.maxHeight;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () => countdownTimer.startWork(),
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: const Text('Kerja'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        onPressed: () => countdownTimer.startBreak(true),
                        child: const Text('Istirahat Pendek'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.indigo,
                        textColor: Colors.white,
                        onPressed: () => countdownTimer.startBreak(false),
                        child: const Text('Istirahat Panjang'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  initialData: '00:00',
                  stream: countdownTimer.stream(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    TimerModel timer = (snapshot.data == '00:00')
                        ? TimerModel('00:00', 1)
                        : snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularPercentIndicator(
                        radius: availableWidth / 3,
                        lineWidth: 10.0,
                        percent: timer.percent,
                        center: Text(
                          timer.time,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                        progressColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () => countdownTimer.stopTimer(),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: const Text('Berhenti'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () => countdownTimer.startTimer(),
                        color: Colors.white,
                        textColor: Colors.black,
                        child: const Text('Lanjut'),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [MadeByWidget()],
              )
            ],
          ),
        );
      }),
    );
  }
}
