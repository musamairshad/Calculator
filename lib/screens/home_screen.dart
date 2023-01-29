import 'package:flutter/material.dart';
// import '../constant.dart';
import '../widgets/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPress(buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        try {
          equation = equation.substring(0, equation.length - 1);
        } catch (error) {
          setState(() {
          equation = "0";
          });
        }
        if (equation == "") {
          equation == "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("÷", "/");
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (error) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          equation,
                          style: TextStyle(
                            fontSize: equationFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: resultFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CalcButton(
                          buttonText: "C",
                          onPressed: () => buttonPress("C"),
                        ),
                        CalcButton(
                          buttonText: "+/-",
                          onPressed: () => buttonPress("+/-"),
                        ),
                        CalcButton(
                            buttonText: "%", onPressed: () => buttonPress("%")),
                        CalcButton(
                          buttonText: "/",
                          onPressed: () => buttonPress("/"),
                          buttonColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalcButton(
                            buttonText: "7", onPressed: () => buttonPress("7")),
                        CalcButton(
                            buttonText: "8", onPressed: () => buttonPress("8")),
                        CalcButton(
                            buttonText: "9", onPressed: () => buttonPress("9")),
                        CalcButton(
                          buttonText: "x",
                          onPressed: () => buttonPress("x"),
                          buttonColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalcButton(
                          buttonText: "4",
                          onPressed: () => buttonPress("4"),
                        ),
                        CalcButton(
                          buttonText: "5",
                          onPressed: () => buttonPress("5"),
                        ),
                        CalcButton(
                          buttonText: "6",
                          onPressed: () => buttonPress("6"),
                        ),
                        CalcButton(
                          buttonText: "-",
                          onPressed: () => buttonPress("-"),
                          buttonColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalcButton(
                          buttonText: "1",
                          onPressed: () => buttonPress("1"),
                        ),
                        CalcButton(
                          buttonText: "2",
                          onPressed: () => buttonPress("2"),
                        ),
                        CalcButton(
                          buttonText: "3",
                          onPressed: () => buttonPress("3"),
                        ),
                        CalcButton(
                          buttonText: "+",
                          onPressed: () => buttonPress("+"),
                          buttonColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalcButton(
                          buttonText: "0",
                          onPressed: () => buttonPress("0"),
                        ),
                        CalcButton(
                          buttonText: ".",
                          onPressed: () => buttonPress("."),
                        ),
                        CalcButton(
                          buttonText: "⌫",
                          onPressed: () => buttonPress("⌫"),
                        ),
                        CalcButton(
                          buttonText: "=",
                          onPressed: () => buttonPress("="),
                          buttonColor: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}