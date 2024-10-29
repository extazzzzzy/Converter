import 'package:converter/ConverterScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ['Масса', 'Длина', 'Температура', 'Валюта', 'Площадь'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Converter')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConverterScreen(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}