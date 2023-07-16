import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 21, 255, 0)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  var userQuestion = '';

  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 238, 243),
        
        body: Container(
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/panda.jpg"),fit: BoxFit.cover)),

          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                   
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 50),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              userQuestion,
                              style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.centerRight,
                            child: Text(
                              userAnswer,
                              style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 0, 17, 255),fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                        if (index == 0) {
                          return Buttons(
                            buttonTaped: () {
                              setState(() {
                                userQuestion = '';
                                userAnswer = '';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.transparent,
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return Buttons(
                            buttonTaped: () {
                              setState(() {
                                if(userQuestion != ""){
                                  userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.transparent,
                            textColor: Colors.white,
                          );
                        } else if (index == buttons.length - 1) {
                          return Buttons(
                            buttonTaped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.transparent,
                            textColor: Colors.white,
                          );
                        } else {
                          return Buttons(
                            buttonTaped: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.transparent
                                : Colors.transparent,
                            textColor: isOperator(buttons[index])
                                ? Colors.transparent
                                : Colors.transparent,
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=')
      return true;
    return false;
  }

  void equalPressed() {
    if(userQuestion!=""){
      String finaQuestion = userQuestion;
    
    Parser p = Parser();
    Expression exp = p.parse(finaQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
    }
  }
}