import 'package:flutter/material.dart';
import 'dart:math';
import 'package:banker/blocs/teams_bloc.dart';
import 'package:banker/models/teams_model.dart';
class TeamsView extends StatelessWidget {
  final String token;
  TeamsView({this.token});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    teamsBloc.fetchTeams(token);
    return Container(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          StreamBuilder(
            stream: teamsBloc.teams,
              builder: (context, AsyncSnapshot<TeamsModel> snapshot) {
                if(snapshot.hasData) {
                  return mainDataWidget(snapshot, screenSize);
                }
                return SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height*0.2, left: 18, right: 18),
                      child: CircularProgressIndicator(),
                    )
                  ]),
                );
              }
          )
        ],
      ),
    );
  }
  Widget mainDataWidget(AsyncSnapshot<TeamsModel> snapshot, screenSize) {
    return SliverList(
      delegate: SliverChildListDelegate(
          snapshot.data.teams.map((team) =>
              teamWidget(screenSize, team.title, team.deadline, team.progress, team.amount)
          ).toList()
         ),
    );
  }

  Widget teamWidget(screenSize, String title, String deadline, int percent, int amount) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: Colors.green[100],
          padding: EdgeInsets.only(left: screenSize.width*0.1, right: screenSize.width*0.1),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Дуусах хугацаа: '+ deadline)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${percent}%', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                  Text('${amount}₮')
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
