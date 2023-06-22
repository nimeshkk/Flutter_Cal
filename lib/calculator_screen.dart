import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  String userInput="";
  String result="0";

  List<String> buttonList=[
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
    'c',
    '0',
    '.',
    '=',

  ];
     

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 38, 33),
      body: Column(
       
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height/3,
            child:Column( mainAxisAlignment: MainAxisAlignment.end, children:[

              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                style: TextStyle(fontSize: 32,color: Colors.white),),
              ),

              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                style: TextStyle(fontSize: 48,color: Colors.white,fontWeight: FontWeight.bold),),
              ),


            ]),
            ),

            Divider(color: Colors.white),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              child:GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  ),
                 itemBuilder:(BuildContext context, int index){

                  return CustomButton(buttonList[index]);
                 }
                   
                 
                 ),

            )),
          
        ],),
    );
  }
  Widget CustomButton(String Text){
    return InkWell(
      splashColor: Colors.blueGrey,
      onTap: (){},
      child:Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );
  }
  
}