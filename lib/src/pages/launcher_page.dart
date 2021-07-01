import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest/src/pages/dark_mode.page.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import 'package:pinterest/src/routes/routes.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: this._scaffoldKey,
        appBar: AppBar(
          title: Text('Disenios en flutter'),
        ),
        drawer: _PrincipalDrawer(),
        body: _ListOptions(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            this
                ._scaffoldKey
                .currentState
                .showBottomSheet((ctx) => _buildBottomSheet(ctx));
            // showModalBottomSheet(
            //     context: context, builder: (ctx) => _buildBottomSheet(ctx));
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.edit_road),
        ),
        bottomNavigationBar: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.list), onPressed: () => {}),
                    IconButton(icon: Icon(Icons.people), onPressed: () => {}),
                  ]),
            ),
          ),
        ));
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(title: Text('What is Lorem Ipsum?')),
            ListTile(
                title: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting')),
            ListTile(
                title: Text(
                    'industry. Lorem Ipsum has been the industrys standard dummy')),
            ListTile(
                title: Text(
                    'text ever since the 1500s, when an unknown printer took a galley')),
            ListTile(
                title: Text(
                    'of type and scrambled it to make a type specimen book. It has')),
            ListTile(
                title: Text(
                    'survived not only five centuries, but also the leap into electronic')),
            ListTile(
                title: Text(
                    'typesetting, remaining essentially unchanged. It was popularised in')),
            ListTile(
                title: Text(
                    'the 1960s with the release of Letraset sheets containing Lorem')),
            ListTile(
                title: Text(
                    'Ipsum passages, and more recently with desktop publishing')),
            ListTile(
                title: Text(
                    'software like Aldus PageMaker including versions of Lorem Ipsum.')),

            // TextField(
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     icon: Icon(Icons.attach_money),
            //     labelText: 'Enter an integer',
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: Icon(Icons.close),
                label: Text('Cerrar'),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
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

class _PrincipalDrawer extends StatefulWidget {
  const _PrincipalDrawer({Key key}) : super(key: key);

  @override
  __PrincipalDrawerState createState() => __PrincipalDrawerState();
}

class __PrincipalDrawerState extends State<_PrincipalDrawer> {
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
