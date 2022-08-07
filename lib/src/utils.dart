// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:andromina_crew_app/src/datamodels/tasks_model.dart';
import 'package:andromina_crew_app/src/services/task_service.dart';
import 'package:intl/intl.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  //equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);


final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Evsent $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 4'),
      Event('Today\'s Event 2'),
    ],
  });


/*
Future<List<Event>> asyncFunction(DateTime day) async {
  final _kEventSource1 = Map<DateTime,List<Event>>();

  final future_test = TaskService().getAllTask();
  final test = await future_test;
  /*
  final _kTaskSource = Map.fromIterable(test,
      key: (item) => test[item].start_date,
      value: (item) => test[item]);
  print (_kTaskSource);
  */
  for (var t in test){
    DateTime _date = DateFormat("yMMMMd").parse(t.start_date);
    _kEventSource1[_date] = [Event(t.name)];
    //print (t.start_date);
  }
  //print(kEvents);
  //print(_kEventSource1);
  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_kEventSource);

  return kEvents[day];
}
*/

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);