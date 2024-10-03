import 'package:fairy_tail/widgets/header_widget.dart';
import 'package:fairy_tail/widgets/lista_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    body: Column(
    children:<Widget>[
    HeaderWidget(),
    Listapersonajes(),
        ],
      ),
      
    );
  }
}