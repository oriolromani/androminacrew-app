import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/blocs/form_bloc.dart';

class Helper {
  Widget errorMessage(FormBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.errorMessage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data as String, style: TextStyle(color: Colors.red));
        }
        return Text('');
      },
    );
  }
}
