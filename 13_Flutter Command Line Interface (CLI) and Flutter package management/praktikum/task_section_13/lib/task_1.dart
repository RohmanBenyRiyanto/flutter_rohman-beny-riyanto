import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:task_section_13/task_2.dart';

class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  int _counter = 0;
  int reset = 0;

  void add() {
    return setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bages Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Chip(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.deepPurple,
              label: Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
            Badge(
              toAnimate: true,
              shape: BadgeShape.square,
              badgeColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              badgeContent: Text(
                'BADGE ${_counter.toString()}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter = reset;
                });
              },
              child: const Text('Reset Bagde'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodePage()));
              },
              child: const Text('Pindah ke Barcode Page'),
            ),  
          ],
        ),
      ),
    );
  }
}
