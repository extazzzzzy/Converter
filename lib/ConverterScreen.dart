import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  final String category;

  ConverterScreen({required this.category});

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  double input = 0.0;
  double output = 0.0;
  String fromUnit = '';
  String toUnit = '';

  List<String> units = [];
  final Map<String, List<String>> categoryUnits = {
    'Длина': ['Сантиметр', 'Метр', 'Километр'],
    'Масса': ['Грамм', 'Килограмм', 'Тонна'],
    'Температура': ['Цельсий', 'Фаренгейт', 'Кельвин'],
    'Валюта': ['Рубль', 'Доллар', 'Тенге'],
    'Площадь': ['Квадратный метр', 'Гектар', 'Ар(сотка)'],
  };

  @override
  void initState() {
    super.initState();
    units = categoryUnits[widget.category]!;
    fromUnit = units[0];
    toUnit = units[1];
  }

  void convert() {
    if (fromUnit != toUnit) {
      if (widget.category == 'Длина') { // условия конвертации длины
        if (fromUnit == 'Сантиметр') {
          if (toUnit == 'Метр') {
            output = input / 100;
          }
          else {
            output = input / 100000;
          }
        }
        else if (fromUnit == 'Метр') {
          if (toUnit == 'Сантиметр') {
            output = input * 100;
          }
          else {
            output = input / 1000;
          }
        }
        else if (fromUnit == 'Километр') {
          if (toUnit == 'Сантиметр') {
            output = input * 100000;
          }
          else {
            output = input * 1000;
          }
        }
      }

      else if (widget.category == 'Масса') { // условия конвертации массы
        if (fromUnit == 'Грамм') {
          if (toUnit == 'Килограмм') {
            output = input / 1000;
          }
          else {
            output = input / 1000000;
          }
        }
        else if (fromUnit == 'Килограмм') {
          if (toUnit == 'Грамм') {
            output = input * 1000;
          }
          else {
            output = input / 1000;
          }
        }
        else if (fromUnit == 'Тонна') {
          if (toUnit == 'Грамм') {
            output = input * 1000000;
          }
          else {
            output = input * 1000;
          }
        }
      }

      else if (widget.category == 'Температура') { // условия конвертации температуры
        if (fromUnit == 'Цельсий') {
          if (toUnit == 'Фаренгейт') {
            output = input * 33.8;
          }
          else {
            output = input * 274.15;
          }
        }
        else if (fromUnit == 'Фаренгейт') {
          if (toUnit == 'Цельсий') {
            output = input / 33.8;
          }
          else {
            output = input * 255.93;
          }
        }
        else if (fromUnit == 'Кельвин') {
          if (toUnit == 'Цельсий') {
            output = input / 274.15;
          }
          else {
            output = input / 255.93;
          }
        }
      }

      else if (widget.category == 'Валюта') { // условия конвертации валюты
        if (fromUnit == 'Рубль') {
          if (toUnit == 'Доллар') {
            output = input * 0.010285;
          }
          else {
            output = input * 4.99;
          }
        }
        else if (fromUnit == 'Доллар') {
          if (toUnit == 'Рубль') {
            output = input / 0.010285;
          }
          else {
            output = input * 492.52;
          }
        }
        else if (fromUnit == 'Тенге') {
          if (toUnit == 'Рубль') {
            output = input / 4.99;
          }
          else {
            output = input / 492.52;
          }
        }
      }

      else  { // условия конвертации площади
        if (fromUnit == 'Квадратный метр') {
          if (toUnit == 'Гектар') {
            output = input * 0.0001;
          }
          else {
            output = input * 0.01;
          }
        }
        else if (fromUnit == 'Гектар') {
          if (toUnit == 'Квадратный метр') {
            output = input / 0.0001;
          }
          else {
            output = input * 100;
          }
        }
        else if (fromUnit == 'Ар(сотка)') {
          if (toUnit == 'Квадратный метр') {
            output = input / 0.01;
          }
          else {
            output = input / 100;
          }
        }
      }
    }
    else {
      output = input;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите значение'),
              onChanged: (val) {
                input = double.tryParse(val) ?? 0.0;
              },
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (newValue) {
                    setState(() {
                      fromUnit = newValue!;
                    });
                  },
                  items: units.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                IconButton(
                  icon: Icon(Icons.swap_horiz),
                  onPressed: () {
                    setState(() {
                      var temp = fromUnit;
                      fromUnit = toUnit;
                      toUnit = temp;
                    });
                    convert();
                  },
                ),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (newValue) {
                    setState(() {
                      toUnit = newValue!;
                    });
                  },
                  items: units.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: convert,
              child: Text('Конвертировать'),
            ),
            SizedBox(height: 20),
            Text('Результат: $output'),
          ],
        ),
      ),
    );
  }
}
