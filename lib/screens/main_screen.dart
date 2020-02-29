import 'package:template/providers/app_provider.dart';
import 'package:template/utils/consts.dart';
import 'package:template/database/database_helper.dart';
import 'package:template/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text("${Constants.appName}"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              doLogout();
            }
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Home Screen.')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.lightbulb_outline),
        onPressed: () {
          changeTheme();
        },
      ),
    );
  }

  changeTheme() async {
    var theme = await Provider.of<AppProvider>(_ctx, listen: false).checkTheme();
    if (theme == Constants.lightTheme) {
      Provider.of<AppProvider>(_ctx, listen: false)
          .setTheme(Constants.darkTheme, "dark");
    } else {
      Provider.of<AppProvider>(_ctx, listen: false)
          .setTheme(Constants.lightTheme, "light");
    }
  }

  doLogout() async {
    var db = new DatabaseHelper();
    await db.deleteUsers();

    Navigator.pushReplacement(
      _ctx,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: LoginScreen(),
      ),
    );
  }
}
