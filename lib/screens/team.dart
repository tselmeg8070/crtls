import 'package:flutter/material.dart';
import 'package:banker/models/auth_model.dart';
import 'package:banker/models/team_model.dart';
import 'package:banker/blocs/teams_bloc.dart';
class TeamView extends StatefulWidget {
  final String id;
  AsyncSnapshot<AuthModel> snapshot;
  TeamView({this.id, this.snapshot});
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {

  @override
  Widget build(BuildContext context) {
    teamBloc.fetchTeam(widget.id);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.green,
        child:  StreamBuilder(
            stream: teamBloc.teams,
            builder: (context, AsyncSnapshot<TeamModel> snapshot) {
              if (snapshot.hasData) {
                return dataWidget(snapshot, screenSize);
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
      ),
    );
  }
  Widget dataWidget(AsyncSnapshot<TeamModel> snapshot, screenSize) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.green,
          elevation: 1,
          pinned: true,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.save_alt),
            ),
          ),
          expandedHeight: 105.0,
          flexibleSpace: FlexibleSpaceBar(
//              background: ,
            titlePadding: EdgeInsets.only(left: 56, bottom: 13),
            centerTitle: false,
            title: Text(
              'Хадгаламж ${snapshot.data.amount}₮',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(top: 14.0, left: screenSize.width * 0.1, right: screenSize.width * 0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.grey[100],
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('assets/income.png', width: screenSize.width*0.2,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('0₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                            Text('Хуримтлуулсан', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500),)

                          ],),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Гишүүд', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                      Column(
                        children: snapshot.data.members.map((item) =>
                          Text(item.fname + ' ' + item.lname)
                        ).toList(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        )
      ],
    );
  }


}