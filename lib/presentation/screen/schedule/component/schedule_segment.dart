import 'package:flutter/material.dart';
import 'package:medical_health_care/common/const/color.dart';

enum ScheduleType { upcoming, completed, canceled }

class ScheduleSegment extends StatelessWidget {
  final ScheduleType scheduleType;
  final ValueChanged<ScheduleType> onChange;

  const ScheduleSegment({
    Key? key,
    required this.scheduleType,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SegmentedButton<ScheduleType>(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => states.contains(MaterialState.selected)
                ? primaryColor
                : Colors.white24,
          ),
          iconSize: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              return states.contains(MaterialState.selected)
                  ? Colors.white
                  : Colors.black45;
            },
          ),
        ),
        segments: const [
          ButtonSegment(
            value: ScheduleType.upcoming,
            label: Text('Upcoming'),
          ),
          ButtonSegment(
            value: ScheduleType.completed,
            label: Text('Completed'),
          ),
          ButtonSegment(
            value: ScheduleType.canceled,
            label: Text('Canceled'),
          ),
        ],
        selected: <ScheduleType>{scheduleType},
        onSelectionChanged: (Set<ScheduleType> newSelection) {
          onChange(newSelection.first);
        },
      ),
    );
  }
}