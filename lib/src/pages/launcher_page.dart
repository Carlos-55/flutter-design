import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Disenios en flutter'),
        ),
        drawer: _PrincipalDrawer(),
        body: _ListOptions());
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoute.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoute[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoute[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoute[i].page));
        },
      ),
    );
  }
}

class _PrincipalDrawer extends StatelessWidget {
  const _PrincipalDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'CB',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListOptions()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: true, activeColor: Colors.blue, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: true, activeColor: Colors.blue, onChanged: (value) {}),
            )
          ],
        ),
      ),
    );
  }
}
