import 'package:flutter/material.dart';

class DaysWidget extends StatefulWidget {
   DaysWidget({super.key});

  @override
  State<DaysWidget> createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> {
  int _selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedDayIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDayIndex = index;
              });
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sun',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '17',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
