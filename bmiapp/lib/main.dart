import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Weight(in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Height(in Feet)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Weight(in Inch)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wT = wtController.text.toString();
                      var fT = ftController.text.toString();
                      var iN = inController.text.toString();
                      if (wT != "" && fT != "" && iN != "") {
                        var iWT = int.parse(wT);
                        var ifT = int.parse(fT);
                        var iNT = int.parse(iN);

                        var tInch = (ifT * 12) + iNT;
                        var tCm = (tInch) * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWT / (tM * tM);
                        if (bmi > 25) {
                          result = "You are Over Weight $bmi";
                        } else if (bmi < 18) {
                          result = "You are Under Weight $bmi";
                        } else {
                          result = "You are Healthy $bmi";
                        }

                        setState(() {});
                      } else {
                        setState(() {
                          result = "Fill all the feilds";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                )
              ],
            ),
          ),
        ));
  }
}
