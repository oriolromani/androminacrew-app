import 'package:andromina_crew_app/responsive/constants.dart';
import 'package:andromina_crew_app/src/datamodels/gig_model.dart';
import 'package:andromina_crew_app/src/services/gig_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive_layout.dart';
import 'mobile_gig_detail.dart';


class MobileGigs extends StatefulWidget {
  const MobileGigs({Key? key}) : super(key: key);

  @override
  _MobileGigsState createState() => _MobileGigsState();
}

class _MobileGigsState extends State<MobileGigs> {
  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.blue,
        child: FutureBuilder(
          future: GigService().getAllGig(),
          builder: (BuildContext context,
              AsyncSnapshot snapshot) {
            if (snapshot.hasData){
              List<GigModel> gigs = snapshot.data as List<GigModel>;
              return ListView.builder(
                    itemCount: gigs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                //TaskDetailScreen1(task: meetingDetails)
                                ResponsiveLayout(
                                    mobileScaffold: MobileGigDetail(gig: gigs[index]),
                                    tabletScaffold: MobileGigDetail(gig: gigs[index]),
                                    desktopScaffold: MobileGigDetail(gig: gigs[index])
                                )
                            ),
                            //).then(onGoBack);
                          );
                        },
                        child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(gigs[index].venue!=null?gigs[index].name + " | "+ gigs[index].venue:gigs[index].name),
                                    ),
                              ],
                            )
                        ),
                      );
                    }
                );
            }else{
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()
              );
            }
          },
        ),
      ),
    );
  }
}
