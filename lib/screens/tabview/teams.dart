import 'package:flutter/material.dart';
import 'package:banker/screens/create_team.dart';
import 'package:banker/blocs/teams_bloc.dart';
import 'package:banker/models/teams_model.dart';
import 'package:banker/screens/team.dart';
import 'package:banker/models/auth_model.dart';

class TeamsView extends StatelessWidget {
//  final String token;
  final AsyncSnapshot<AuthModel> snapshot;
  TeamsView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    teamsBloc.fetchTeams(snapshot.data.token);
    return Container(
      padding: EdgeInsets.only(top: 70),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RaisedButton(
                color: Colors.blueAccent[100],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CreateTeamView(snapshot: snapshot,)));
                },
                child:
                    const Text('Баг үүсгэх', style: TextStyle(fontSize: 20)),
              ),
            ),
          ])),
          StreamBuilder(
              stream: teamsBloc.teams,
              builder: (context, AsyncSnapshot<TeamsModel> snapshot) {
                if (snapshot.hasData) {
                  return mainDataWidget(snapshot, screenSize, context);
                }
                return SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSize.height * 0.2, left: 18, right: 18),
                      child: CircularProgressIndicator(),
                    )
                  ]),
                );
              })
        ],
      ),
    );
  }

  Widget mainDataWidget(
      AsyncSnapshot<TeamsModel> snapshot, screenSize, context) {
    return SliverList(
        delegate: SliverChildListDelegate(snapshot.data.teams
            .map((team) => teamWidget(screenSize, team.id, team.title,
                team.deadline, team.progress, team.amount, context))
            .toList()));
  }

  Widget teamWidget(screenSize, String id, String title, String deadline,
      int percent, int amount, context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0, left: 18.0, right: 18.0),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TeamView(
                      id: id,
                  snapshot: snapshot
                    )),
          )
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            color: Colors.green[100], //TODO(1) progress
            padding: EdgeInsets.only(
                left: screenSize.width * 0.1, right: screenSize.width * 0.1),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Дуусах хугацаа: ' + deadline)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${percent}%',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text('${amount}₮')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
