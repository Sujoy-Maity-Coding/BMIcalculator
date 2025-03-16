import 'package:bmi_calculator/common_widget.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height = 150;
  int age=30;
  int weight=50;
  Color maleColour = Color(0xff033e66);
  Color femaleColour = Color(0xff033e66);

  calBmi(){
    var heightInMt=height/100;
    var bmi=weight/(heightInMt*heightInMt);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultScreen(bmi: bmi.round(),)));
  }

  void SelectGender(bool gender){
    if(gender){
      setState(() {
        maleColour=blueColor;
        femaleColour=selectedColor;
      });
    }else{
      setState(() {
        maleColour=selectedColor;
        femaleColour=blueColor;
      });
    }
  }

  addSubAge(bool ageAdd){
    if(ageAdd){
      setState(() {
        age++;
      });
    }else{
      setState(() {
        age--;
      });
    }
  }

  addSubWeight(bool weightAdd){
    if(weightAdd){
      setState(() {
        weight++;
      });
    }else{
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: darkBlueColour,
      ),
      backgroundColor: darkBlueColour,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          SelectGender(true);
                        });
                      },
                      child: CommonWidget(
                        color: maleColour,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                FaIcon(FontAwesomeIcons.mars, size: 70, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Male", style: textStyle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          SelectGender(false);
                        });
                      },
                      child: CommonWidget(
                        color: femaleColour,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                FaIcon(FontAwesomeIcons.venus, size: 70, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Female", style: textStyle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CommonWidget(
                color: blueColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Height", style: textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Text("$height", style: numberStyle),
                          ),
                          Text("cm", style: numberStyle),
                        ],
                      ),
                      Slider(
                        min: 120,
                        max: 200,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white30,
                        thumbColor: Colors.pink,
                        value: height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CommonWidget(color: blueColor, cardChild: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text("Age", style: textStyle,),
                          Text("${age}", style: numberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: RoundButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState(() {
                                  addSubAge(true);
                                });
                              },),
                            ),
                            RoundButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                addSubAge(false);
                              });
                            },)
                          ],)
                        ],
                      ),
                    ),
                  ))),
                  Expanded(child: CommonWidget(color: blueColor, cardChild: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text("Weight", style: textStyle,),
                          Text("${weight}", style: numberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: RoundButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                  setState(() {
                                    addSubWeight(true);
                                  });
                                },),
                              ),
                              RoundButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  addSubWeight(false);
                                });
                              },)
                            ],)
                        ],
                      ),
                    ),
                  ))),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                calBmi();
              },
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
          ],
        ),
      ),
    );
  }
}
