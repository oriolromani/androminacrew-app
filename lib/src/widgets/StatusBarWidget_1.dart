import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';

Widget StatusBarWidget1(task) {
  const appSteps = [
    'Proposed',
    'Accepted',
    'Working',
    'End',
  ];

  const iconSteps = [
    Icons.auto_awesome,
    //Icons.check_circle_outline_outlined,
    Icons.check_outlined,
    Icons.query_builder,
    Icons.receipt_long_outlined,
  ];



  var currentStep = 2;

  switch(task.status){
    case "proposed":
      currentStep = 0;
      break;
    case "confirmed":
      currentStep = 1;
      var start_date = DateFormat.yMMMMd('en_US').parse(task.start_date);
      var today = DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
      if(start_date.isAfter(DateTime.now())){
        currentStep = 1;
      }else if (task.start_date == today){
        currentStep = 2;
      }else{
        currentStep = 3;
      }
      break;
    case "rejected":
      currentStep = 3;
      break;
  }

  Color iconColor(index){
    if (index<=currentStep){
      if(task.status=="rejected"){
        return Colors.redAccent;
      }else {
        //return Colors.blueGrey;
        return Colors.green;
      }
    }else{
      return Color(0xFFD4D4D4);
    }
  }

  return Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.fromLTRB(2, 20, 2, 20),
    margin: const EdgeInsets.all(2),
    constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 140),
    decoration: BoxDecoration(
        //color: Colors.grey,
        //border: Border.all(width: 1, color: const Color(0xFF9F92E2)),
      ),
    child: Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: appSteps.length,
          itemBuilder: (BuildContext context, int index) {
            var beforeLineStyle = const LineStyle(
              thickness: 20,
              color: Color(0xFFD4D4D4),
            );

            LineStyle afterLineStyle;
            if (index <= currentStep) {
              if(task.status=="rejected"){
                beforeLineStyle = const LineStyle(
                  thickness: 20,
                  //color: Color(0xFF9F92E2),
                  color: Colors.redAccent,
                );
              }else {
                beforeLineStyle = const LineStyle(
                  thickness: 20,
                  //color: Color(0xFF9F92E2),
                  color: Colors.green,
                );
              }
            }

            if (index == currentStep) {
              if(task.status=="rejected"){
                afterLineStyle = const LineStyle(
                  thickness: 20,
                  //color: Color(0xFFD4D4D4),
                  color: Colors.redAccent,
                );
              }else {
                afterLineStyle = const LineStyle(
                  thickness: 20,
                  //color: Color(0xFFD4D4D4),
                  color: Colors.green,
                );
              }
            }

            final isFirst = index == 0;
            final isLast = index == appSteps.length - 1;
            var indicatorX = 0.5;
            if (isFirst) {
              indicatorX = 0.3;
            } else if (isLast) {
              indicatorX = 0.7;
            }

            return TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.manual,
              lineXY: 0.8,
              isFirst: isFirst,
              isLast: isLast,
              endChild: Container(
                constraints: const BoxConstraints(
                  minWidth: 80,
                ),
              ),
              beforeLineStyle: beforeLineStyle,
              //afterLineStyle: afterLineStyle,
              hasIndicator: index <= currentStep || isLast,
              indicatorStyle: IndicatorStyle(
                width: 20,
                height: 20,
                indicatorXY: indicatorX,
                color: const Color(0xFFD4D4D4),
                //color: Colors.green
                //indicator: index <= currentStep ? const _IndicatorApp() : null,
              ),
              startChild: Container(
                constraints: const BoxConstraints(
                    maxWidth: 50),
                margin: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconSteps[index],
                      //color: Color(0xFFD4D4D4),
                      color: iconColor(index),
                      size: 40,
                    ),
                    //Image.asset('../assets/app/$index.png', height: 40),
                    //const SizedBox(width: 4),
                    //Text(
                      //appSteps[index],
                      //style: GoogleFonts.sniglet(
                      //  fontSize: 14,
                      //  color: index <= currentStep
                      //      ? const Color(0xFF9F92E2)
                      //      : const Color(0xFFD4D4D4),
                      //),
                    //)
                  ],
                ),
              ),
            );
          },
        ),
    ),
  );
}