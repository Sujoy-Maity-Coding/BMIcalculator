import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int bmi;
  const ResultScreen({super.key, required this.bmi});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmiColour=Colors.white;
  var bmiText="Normal";
  var bmiImgPath="normal";

  @override
  void initState() {
    super.initState();  // Always call super.initState()
    updateUI();         // Call updateUI() directly
  }
  void updateUI(){
    var bmi=widget.bmi;
    if(bmi<18){
      setState(() {
        bmiColour=Colors.lightBlueAccent;
        bmiText="Underweight";
        bmiImgPath="underweight";
      });
    }else if(bmi>=18 && bmi<=25){
      setState(() {
        bmiColour=Colors.green;
        bmiText="Normal";
        bmiImgPath="normal";
      });
    }else if(bmi>25 && bmi<=30){
      setState(() {
        bmiColour=Colors.yellowAccent;
        bmiText="Overweight";
        bmiImgPath="overweight";
      });
    }else if(bmi>30 && bmi<=35){
      setState(() {
        bmiColour=Colors.orange;
        bmiText="Obese";
        bmiImgPath="obese";
      });
    }else{
      setState(() {
        bmiColour=Colors.red;
        bmiText="Extreme";
        bmiImgPath="extreme";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: darkBlueColour,),
      backgroundColor: darkBlueColour,
      body: Column(children: [
        Container(decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5)),
        height: height*0.23,
        width: width,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Your BMI value is:", style: textStyle.copyWith(fontSize: 24),),
          Text("${widget.bmi}", style: numberStyle,),
          Text("${bmiText}", style: textStyle.copyWith(color: bmiColour),)
        ],),),
        Image.asset('images/${bmiImgPath}.png',height: height*0.55,width: width,),
        GestureDetector(
          onTap: (){ Navigator.pop(context); },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Calculate BMI",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],),
    );
  }
}
