import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
               primaryColor: Colors.black
              ), 
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (_currentStep < 2) {
                      _currentStep += 1;
                    } else {
                      _currentStep = 0;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentStep > 0) {
                      _currentStep -= 1;
                    } else {
                      _currentStep = 0;
                    }
                  });
                },
                steps: [
                  Step(
                    title: Text("Login"), 
                    subtitle: Text("Login first"),
                    content: Text("Are you sure to Login? This can help your account willnot be still"),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text("Update Your Personal Info"), 
                    subtitle: Text("personal info second"),
                    content: Text("Are you finish your personal info?"),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text("Security"), 
                    subtitle: Text("finish Security third"),
                    content: Text("Are you finish your security? This can help your account willnot be stil "),
                    isActive: _currentStep == 2
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}