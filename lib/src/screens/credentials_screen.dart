import 'package:flutter/material.dart';
import 'package:andromina_crew_app/src/screens/drawer.dart';
import 'package:andromina_crew_app/src/services/user_service.dart';
import 'package:andromina_crew_app/src/datamodels/user_model.dart';


class CredentialsScreen extends StatefulWidget {
  @override
  _CredentialsScreenState createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  Future<User>?  futureUser;

  @override
  void initState(){
    super.initState();
    futureUser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Credentials',
          style:TextStyle(
            color: Colors.black,
          ),
        ),
        elevation:4,
        backgroundColor: Colors.redAccent[100],
    ),
    body: Center(
    child: FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
           alignment: Alignment.topCenter,
           //color:Colors.limeAccent,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [
                 Colors.grey,
                 Colors.grey,
               ],
             )
           ),
           child:SingleChildScrollView(
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(5)),
                 color: Colors.grey[200],
               ),
              padding: EdgeInsets.fromLTRB(40, 40, 40, 40) ,
              margin: EdgeInsets.all(10.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(),
                 Text('username',
                     style: TextStyle(
                       color:Colors.grey[700],
                     )
                 ),

                 Text(snapshot.data!.username,
                     style: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     )
                 ),
                 SizedBox(height: 20),
                 Text('first_name',
                     style: TextStyle(
                       color:Colors.grey[700],
                     )
                 ),
                 Text(snapshot.data!.first_name,
                     style: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     )
                 ),
                 SizedBox(height: 20),
                 Text('last_name',
                     style: TextStyle(
                       color:Colors.grey[700],
                     )
                 ),
                 Text(snapshot.data!.last_name,
                     style: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     )
                 ),
                 SizedBox(height: 20),
                 Text('email',
                     style: TextStyle(
                       color:Colors.grey[700],
                     )
                 ),
                 Text(snapshot.data!.email,
                     style: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     )
                 ),
                 SizedBox(height: 30),
                 Text('androminaRent (uid)',
                     style: TextStyle(
                       color:Colors.grey[700],
                     )
                 ),
                 Text(snapshot.data!.uid,
                     style: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 30,
                     )
                 ),
               ],
             ),
           ),

           )
          );
        } else if (snapshot.hasError){
          return Container(
              padding: EdgeInsets.all(100),
              alignment: Alignment.topCenter,
              //color:Colors.limeAccent,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey,
                      Colors.grey,
                    ],
                  )
              ),
              child:Text('${snapshot.error}')
          );
        }
        return const CircularProgressIndicator();
      },
    ),
    ),
    drawer: MyDrawer());
  }
}

/*
class CredentialsScreen extends StatelessWidget {
  var res = UserService().getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
      ),
      body: Center(
        child: Text('Hi Credeentials'),
      ),
      drawer: MyDrawer(),
    );
  }
}
 */