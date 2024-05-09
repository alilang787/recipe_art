import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Steps extends StatelessWidget {
  const Steps({super.key, required this.steps});
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(8),
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Text('${index + 1}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'STEP ${index + 1}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(steps[index]),
            ),
            Divider(
              thickness: 5,
            )
          ],
        );
      },
    );
  }
}
