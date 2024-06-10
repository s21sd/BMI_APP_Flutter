import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  var result;
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
                        // Bmi calculation
                      } else {
                        setState(() {
                          Fluttertoast.showToast(
                              msg: 'Please fill All the feild',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor:
                                  const Color.fromARGB(255, 221, 198, 197),
                              fontSize: 16);
                        });
                      }
                    },
                    child: const Text('Calculate')),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                )
              ],
            ),
          ),
        ));
  }
}
