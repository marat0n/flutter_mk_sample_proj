import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;
  int counter = 0;

  pages() => [
    const Center(
      child: Text(
        "Hello, World!",
        style: TextStyle(fontSize: 50),
      )
    ),

    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: () => setState(() => counter++),
            child: const Text("+ 1")
          )
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(20))
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Кликни меня!',
                style: TextStyle(fontSize: 20)
              )
            )
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: pages()[index],

      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (selected) => setState(() => index = selected),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.plus_one_rounded),
            label: "Counter",
          )
        ],
      ),
    );
  }
}
