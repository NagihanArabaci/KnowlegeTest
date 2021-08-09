import 'package:bilgitest/class.dart';
import 'package:bilgitest/const.dart';
import 'package:bilgitest/test.dart';
import 'package:flutter/material.dart';

void main() => runApp(knowledgeTest());

class knowledgeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.lightBlue[900],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: questionPage(),
            ))));
  }
}

class questionPage extends StatefulWidget {
  @override
  _questionPageState createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {
  List<Widget> choices = [];

  testView test_1 = testView();
  void buton(bool choice) {
    if (test_1.testFinish() == true) {
      showDialog(
        context: context,
        builder: (builder) => AlertDialog(
          title: Text('TEST FİNİSHED'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'))
          ],
        ),
      );
      setState(() {
        test_1.resetTest();
        choices = [];
      });
    } else {
      setState(() {
        test_1.getanswer() == choice
            ? choices.add(falseIcon)
            : choices.add(trueIcon);

        test_1.questionNumber();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: choices,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[900],
                          child: Text(
                            'True',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            buton(true);
                          },
                        ))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[800],
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {
                        buton(false);
                      },
                    ),
                  ),
                ),
              ])),
        )
      ],
    );
  }
}
