import 'package:flutter/material.dart';

void main() {
  runApp(const SpinnerApp());
}

class SpinnerApp extends StatelessWidget {
  const SpinnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // app settings
      title: 'Spinner App',
      theme: ThemeData.dark(),
      // home screen
      home: const SpinnerScreen(),
    );
  }
}

class SpinnerScreen extends StatefulWidget {
  const SpinnerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpinnerScreenState createState() => _SpinnerScreenState();
}

class _SpinnerScreenState extends State<SpinnerScreen> {
  // List of items for the spinner
  List<String> items = ['BCA', 'MCA', 'MSc', 'BBA', 'BCom'];
  String selectedItem = 'BCA'; // Default selected item
  String submittedItem = ''; // Selected item to display

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinner Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              // Row contains text and the dropdownbtn
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Select course:',
                ),
                // spinner control in flutter is DropdownButton
                DropdownButton<String>(
                  value: selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SizedBox(
                        width: 70,
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // submit btn
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submittedItem = selectedItem;
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            // displaying selected item from dropdown
            Text(
              'Selected course: $submittedItem',
            ),
          ],
        ),
      ),
    );
  }
}
