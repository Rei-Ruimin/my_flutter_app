import 'package:my_flutter_app/constants/app_constants.dart';
import 'package:my_flutter_app/widgets/left_bar.dart';
import 'package:my_flutter_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // no shadow effect
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height\n(m)",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )
                    ),
                  )
                ),
                Container(
                    width: 130,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,

                      ),
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight\n(kg)",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8),
                          )
                      ),

                    )
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w/(_h*_h);
                  if(_bmiResult>25){
                    _textResult = 'Over Weight';
                  }
                  else if(_bmiResult>=18.5) {
                    _textResult = 'Normal Weight';
                  }
                  else{
                    _textResult = 'Under Weight';
                  }
                });
              },
              child: Container(
                child: Text(
                    "Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, color: accentHexColor),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: accentHexColor),),
              ),
            ),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 70),
            SizedBox(height: 20),
            LeftBar(barWidth: 40),

            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 50,),
            RightBar(barWidth: 70),


          ],
        ),
      ),


    );
  }
}
