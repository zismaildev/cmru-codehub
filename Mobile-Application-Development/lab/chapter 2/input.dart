import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

final fullnameInput = TextEditingController();
final emailInput = TextEditingController();
int? radioData = 1;

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Form By Nattapong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 68, 68),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration Form'),
            TextFormField(
              controller: fullnameInput,
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter your full-name",
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: emailInput,
              decoration: InputDecoration(
                labelText: "Emai",
                hintText: "Enter your email",
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: radioData,
                    onChanged: (value) {
                      setState(() {
                        radioData = value;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 2,
                    groupValue: radioData,
                    onChanged: (value) {
                      setState(() {
                        radioData = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  String strRadio = radioData == 1 ? 'Male' : 'Female';
                  if (fullnameInput.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            children: [Text("Please Enter Your FullName")],
                          ),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            children: [
                              Text("Welcome"),
                              Text(fullnameInput.text),
                              Text(emailInput.text),
                              Text(strRadio),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text('Click Here!!!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
