import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopwatchScreen(),
    );
  }
}

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Stream<int> _stopwatchStream = Stream.periodic(Duration(seconds: 1), (i) => i);
  int _elapsedSeconds = 0;
  bool _isRunning = false;
  late StreamSubscription<int> _streamSubscription;
  DateTime? _startTime;

  void _toggleStopwatch() {
    if (_isRunning) {
      _stopStopwatch();
    } else {
      _startStopwatch();
    }
  }

  void _startStopwatch() {
    _startTime = DateTime.now().subtract(Duration(seconds: _elapsedSeconds));
    _streamSubscription = _stopwatchStream.listen((elapsedTime) {
      setState(() {
        _elapsedSeconds = DateTime.now().difference(_startTime!).inSeconds;
      });
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _stopStopwatch() {
    _streamSubscription.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetStopwatch() {
    _streamSubscription.cancel();
    setState(() {
      _elapsedSeconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int timeInSeconds) {
    int hours = timeInSeconds ~/ 3600;
    int minutes = (timeInSeconds % 3600) ~/ 60;
    int seconds = timeInSeconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time: ${_formatTime(_elapsedSeconds)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleStopwatch,
              child: Text(_isRunning ? 'Stop' : 'Start'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetStopwatch,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
