import 'package:intl/intl.dart';

class DateModel {
  final DateTime dateTime;

  DateModel({required this.dateTime});

  DateModel.fromString(String dateString) : dateTime = parseString(dateString);

  static String formatDate(String s){
    DateTime date = DateTime.parse(s);
    String date_formated = DateFormat('d/M/y').add_Hm().format(date).toString();
    return date_formated;
  }

  static DateTime parseString(String s) {

    List<String> l = s.split('T');
    List<int> dateTokens = l[0].split('-').map((e) => int.parse(e)).toList();
    if (l.length == 1) {
      return DateTime(dateTokens[0], dateTokens[1], dateTokens[2]);
    } else {
      List<int> timeTokens = l[1].split(':').map((e) => int.parse(e)).toList();
      return DateTime(dateTokens[0], dateTokens[1], dateTokens[2],
          timeTokens[0], timeTokens[1], timeTokens[2]);
    }
  }
/*
  static String toDateTime(String s) {
    List<String> l = s.split(' ');
    if (l.length == 1) {
      return l[0];
    } else {
      return l[0] + 'T' + l[2] + ':00';
    }
  }

  String toDTime() {
    String result = DateFormat('yyyy-MM-dd').format(dateTime);
    if (dateTime.hour != null) {
      result += 'T' + DateFormat('HH:mm').format(dateTime) + ':00';
    }
    return result;
  }

  String toString() {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String toDTString() {
    return DateFormat('yyyy-MM-dd - HH:mm').format(dateTime);
  }

  bool isBefore(DateModel other) {
    if (other == null) return true;
    return dateTime.isBefore(other.dateTime);
  }

  bool isAfter(DateModel other) {
    if (other == null) return true;
    return dateTime.isAfter(other.dateTime);
  }

  DateModel add(Duration d) {
    DateModel dm = DateModel(dateTime: dateTime);
    dm.dateTime.add(d);
    return dm;
  }

  DateModel subtract(Duration d) {
    DateModel dm = DateModel(dateTime: dateTime);
    dm.dateTime.subtract(d);
    return dm;
  }

  double difference(DateModel other) {
    Duration d = dateTime.difference(other.dateTime);
    return d.inDays.toDouble() + 1.0;
    //return d.inDays.toDouble() < 1.0 ? 1.0 : d.inDays.toDouble();
  }*/
}
