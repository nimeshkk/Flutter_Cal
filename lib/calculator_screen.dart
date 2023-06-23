import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";

  List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 38, 33),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput.replaceAll("=", ""),
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result.replaceAll("=", ""),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.white),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomButton(buttonList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: const Color.fromARGB(255, 255, 255, 255),
      onTap: () {
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(-3, -3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == 'C' ||
        text == '(' ||
        text == ')') {
      return Color.fromARGB(255, 239, 154, 7);
    }
    return Color.fromARGB(255, 255, 255, 255);
  }

  getBgColor(String text) {
    if (text == 'AC') {
      return Colors.orange;
    }
    if (text == '=') {
      return Color.fromARGB(255, 53, 132, 39);
    }
    return Color.fromARGB(255, 34, 23, 9);
  }

  handleButton(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (text == "=") {
      userInput = userInput.replaceAll("=", ""); 
      result = calculate();
      userInput = result;

      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }

      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
        return;
      }
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Calculator',
//     home: Calculator(),
//   ));
// }


