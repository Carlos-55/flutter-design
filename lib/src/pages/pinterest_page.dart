import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/src/widgets/pinteres_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
          body: Stack(
        children: [
          PinterestGrid(),
          _PinterestMenuLocation(),
          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      )),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreeam = MediaQuery.of(context).size.width;
    final view = Provider.of<_MenuModel>(context).viewMenu;
    return Positioned(
      bottom: 30,
      child: Container(
        // color: Colors.red,
        width: widthScreeam,
        child: Align(
          child: PinterestMenu(
              viewMenu: view,
              activeColor: Colors.red,
              inactiveColor: Colors.white,
              backgroundColor: Colors.grey[900],
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('Hola aqui andamos');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('Hola aqui search');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('Hola aqui notifications');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('Hola aqui supervised_user_circle');
                    })
              ]),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List cards = List.generate(50, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollPrevius = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollPrevius && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).viewMenu = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).viewMenu = true;
      }
      scrollPrevius = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItems(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final int index;
  _PinterestItems(this.index);
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _viewMenu = true;

  bool get viewMenu => this._viewMenu;

  set viewMenu(bool valor) {
    this._viewMenu = valor;
    notifyListeners();
  }
}
