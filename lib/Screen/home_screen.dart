import 'package:dynamic_ui_cubit/Screen/main_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstInput = TextEditingController();
  final TextEditingController _secondInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 153, 163, 201),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Welcome!",
            style: TextStyle(
                color: Color.fromARGB(255, 5, 59, 103),
                fontSize: 18.9,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _firstInput,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'John Doe',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.check),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 216, 131, 131)),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 192, 174, 174),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _secondInput,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  hintText: 'John Doe',
                  prefixIcon: Icon(Icons.dataset_linked),
                  suffixIcon: Icon(Icons.check),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 216, 131, 131)),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 192, 174, 174),
                ),
              ),
              const Spacer(),
              Positioned(
                  bottom: 40.0,
                  height: 20.0,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen(
                                        firstInput: _firstInput.text,
                                        secondInput: _secondInput.text,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 44, 97, 157),
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          "Submit here",
                          style: TextStyle(fontSize: 20.0),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
