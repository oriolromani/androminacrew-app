import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget StatusBarWidget1(status) {
  return
    Expanded(
    child: Row(
      children: [
        TimelineTile(
          axis: TimelineAxis.horizontal,
          alignment: TimelineAlign.manual,
          isFirst: true,
          hasIndicator: true,
          lineXY: 0.3,
          beforeLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
          indicatorStyle: IndicatorStyle(
            indicatorXY: 0.7,
            iconStyle: IconStyle(
              iconData: Icons.ac_unit,
              fontSize: 30,
            ),
          ),
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            color: Colors.lightGreenAccent,
          ),
          startChild: Container(
            color: Colors.amberAccent,
          ),
        ),
        TimelineTile(
          axis: TimelineAxis.horizontal,
          alignment: TimelineAlign.manual,
          lineXY: 0.3,
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            color: Colors.lightGreenAccent,
          ),
          startChild: Container(
            color: Colors.amberAccent,
          ),
        ),
        TimelineTile(
          axis: TimelineAxis.horizontal,
          isLast:true,
          alignment: TimelineAlign.manual,
          lineXY: 0.3,
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            color: Colors.lightGreenAccent,
          ),
          startChild: Container(
            color: Colors.amberAccent,
          ),
        ),
      ],
    ),
  );
}