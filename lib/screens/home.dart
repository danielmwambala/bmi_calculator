import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'height',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor)),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // ignore: avoid_unnecessary_containers
          GestureDetector(
            onTap: () {
              double h = double.parse(_heightController.text);
              double w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = w / (h * h);
                if (_bmiResult > 25) {
                  _textResult = "You're over-weight";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You're normal weight";
                } else {
                  _textResult = "You're under-weight";
                }
              });
            },
            child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          // ignore: avoid_unnecessary_containers
          Visibility(
            visible: _textResult.isNotEmpty,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const LeftBar(barWidth: 40),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 70),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 40),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 70),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 40),
        ]),
      ),
    );
  }
}
