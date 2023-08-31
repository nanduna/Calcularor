import 'package:flutter/material.dart';
import 'package:new_project/Buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyCal());
}

class MyCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuistion = '';
  var userAnswer = '';

  final myTextStyle = TextStyle(fontSize: 50, color: Colors.deepOrange[900]);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuistion,
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //clear button
                    if (index == 0) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userQuistion = "";
                          });
                        },
                        buttonText: buttons[index],
                        Color: Colors.green,
                        textColor: Colors.white,
                      );

                      //delete button
                    } else if (index == 1) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userQuistion = userQuistion.substring(
                                0, userQuistion.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        Color: Colors.red,
                        textColor: Colors.white,
                      );

                      //Equal Bitton
                    } else if (index == buttons.length - 1) {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            equlPrssed();
                          });
                        },
                        buttonText: buttons[index],
                        Color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      return MyButtons(
                        buttonTap: () {
                          setState(() {
                            userQuistion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        Color: isOperator(buttons[index])
                            ? Colors.deepOrange
                            : Colors.deepOrange[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepOrange,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equlPrssed() {
    String finalQuestion = userQuistion;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
