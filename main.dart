import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { male, female }

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  double result = 0; // Updated to double
  bool isa = false;
  Gender selectedGender = Gender.male;
    double dailyCalories=0;
   double calculateCalories(int weight, int height, int age, Gender gender) {
  double bmr;

  if (gender == Gender.male) {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  double activityFactor = 1.375; // Default activity factor
    dailyCalories= bmr * activityFactor;

  return dailyCalories;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('calrios calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 100),
                padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'Enter your height',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.red,
                alignment: Alignment. center,
                margin: EdgeInsets.symmetric(horizontal: 100),
                padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: myController2,
                  decoration: InputDecoration(
                    hintText: 'Enter your weight',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.red,
                alignment: Alignment .center,
                margin: EdgeInsets.symmetric(horizontal: 100),
                padding: EdgeInsets.symmetric(horizontal: 10), // Adjust the padding
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: myController3,
                  decoration: InputDecoration(
                    hintText: 'Enter your age',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  RadioListTile<Gender>(
                    title: Text('Male'),
                    value: Gender.male,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  RadioListTile<Gender>(
                    title: Text('Female'),
                    value: Gender.female,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (myController.text.isNotEmpty && myController2.text.isNotEmpty) {
                    int weight = int.tryParse(myController2.text) ?? 0;
                    int height = int.tryParse(myController.text) ?? 0;
                    int age = int.tryParse(myController3.text) ?? 0;

                    setState(() {
                      result = calculateCalories(weight, height, age, selectedGender);
                      isa = !isa;
                    });
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 44, color: Colors.black),
                ),
              ),
              Text(
                isa ? result.toStringAsFixed(2) : '',
                style: TextStyle(fontSize: 33),
              ),

           Text(
  isa ? result.toStringAsFixed(2) : '',
  style: TextStyle(fontSize: 33),
),

Text(
  'Daily Calories: ${dailyCalories.toStringAsFixed(2)}',
  style: TextStyle(fontSize: 24),
)
            ],
          ),
        ),
      ),
    );
  }
}


