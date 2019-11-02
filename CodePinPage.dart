
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import './WorkerNext.dart';

class WorkerSection extends StatefulWidget {
  @override
  _WorkerSectionState createState() => _WorkerSectionState();
}

class _WorkerSectionState extends State<WorkerSection> {

  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;
  String mdp = "0000";
  bool hasError = false;
  String errorMessage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'ENTRER CODE PIN:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
              ),
              PinCodeTextField(
                autofocus: false,
                hideCharacter: true,
                highlight: true,
                highlightColor: Colors.blue,
                defaultBorderColor: Colors.black,
                hasTextBorderColor: Colors.green,
                maxLength: pinLength,
                hasError: hasError,
                maskCharacter: "*",
                onTextChanged: (text) {
                  setState(() {
                    hasError = false;
                  });
                },
                onDone: (text){
                  setState(() {
                    if (text == mdp){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClientNext()),
                      );
                    }else{
                      this.hasError = true;
                    }
                  },);
                },
                pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                wrapAlignment: WrapAlignment.start,
                pinTextStyle: TextStyle(fontSize: 30.0),
                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 30),
              ),
              Visibility(
                child: Text(
                  "Wrong PIN!",
                  style: TextStyle(color: Colors.red),
                ),
                visible: hasError,
              ),
            ],
          ),
        ),
      ),
    );
  }
}