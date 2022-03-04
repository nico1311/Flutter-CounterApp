import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      if (counter - 1 >= 0) counter--;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Clicks', style: TextStyle(fontSize: 28)),
              Text('$counter',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))
            ]),
      ),
      floatingActionButton: FloatingActions(
        handleIncrease: increase,
        handleDecrease: decrease,
        handleReset: reset,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class FloatingActions extends StatelessWidget {
  final Function handleIncrease;
  final Function handleDecrease;
  final Function handleReset;

  const FloatingActions({
    Key? key,
    required this.handleIncrease,
    required this.handleDecrease,
    required this.handleReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => handleDecrease()
        ),
        FloatingActionButton(
          child: const Icon(Icons.clear_all),
          onPressed: () => handleReset(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1),
          onPressed: () => handleIncrease(),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
