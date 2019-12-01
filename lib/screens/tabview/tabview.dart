import 'package:flutter/material.dart';
import 'package:banker/screens/tabview/home.dart';
import 'package:banker/blocs/auth_bloc.dart';
import 'package:banker/models/auth_model.dart';
import 'package:banker/screens/auth/login.dart';
import 'package:banker/screens/tabview/teams.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authBloc.authUser,
        builder: (context, AsyncSnapshot<AuthModel> snapshot) {
          if(snapshot.hasData) {
            return MainTabView(snapshot: snapshot,);
          }
          return LoginScreen();
        }
    );
  }
}

class MainTabView extends StatelessWidget {
  final AsyncSnapshot<AuthModel> snapshot;
  MainTabView({this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Tab(child: HomeScreen(token: snapshot.data.token)),
              Tab(child: Icon(Icons.directions_bike)),
              Tab(child: TeamsView()),
              Tab(child: Icon(Icons.directions_bike)),
            ],
          ),
          bottomNavigationBar: TabBar(
            unselectedLabelColor:  Colors.grey[500],
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            labelPadding: EdgeInsets.only(left: 0, right: 0),
            tabs: [
              CustomTab(icon: Icons.dashboard, title: 'Нүүр'),
              CustomTab(icon: Icons.monetization_on, title: 'Хувийн'),
              CustomTab(icon: Icons.people, title: 'Баг'),
              CustomTab(icon: Icons.more_horiz, title: 'Цааш'),
            ],
          ),
        ),
      ),
    );;
  }
}
class CustomTab extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomTab({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      padding: EdgeInsets.only(bottom: 3, top: 5),
      child:  Column(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
          )
        ],
      ),
    );
  }
}