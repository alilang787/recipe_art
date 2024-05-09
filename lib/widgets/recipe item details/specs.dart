import 'package:flutter/material.dart';

class Specs extends StatelessWidget {
  const Specs({
    super.key,
    required this.isglu,
    required this.islac,
    required this.isvege,
    required this.isvegan,
  });
  final bool isglu;
  final bool islac;
  final bool isvege;
  final bool isvegan;

  @override
  Widget build(BuildContext context) {
    final List<Map> vals = [
      {'GluetenFree': isglu},
      {'LactosFree': islac},
      {'Vegan': isvegan},
      {'Vegetarian': isvege},
    ];
    return ListView.builder(
      itemCount: vals.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  child: Text(
                    '${vals[index].keys.first}:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  vals[index].values.first ? 'Yes' : 'No',
                  style: TextStyle(
                    color: vals[index].values.first ? Colors.green : Colors.red,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Divider()
          ],
        );
      },
    );
  }
}
