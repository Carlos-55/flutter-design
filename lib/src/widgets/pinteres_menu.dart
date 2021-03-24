import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool viewMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.viewMenu = true,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.blueGrey,
      this.backgroundColor = Colors.white,
      @required this.items});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(
        builder: (BuildContext context) {
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
          Provider.of<_MenuModel>(context).backgroundColor =
              this.backgroundColor;
          return AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: (viewMenu) ? 1 : 0,
              child: _PinterestMenuBackground(child: _MenuItems(items)));
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    Color backgrounColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 20, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (i) => _PinterestMenuButton(index: i, item: menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  const _PinterestMenuButton(
      {this.index,
      this.item,
      this.backgroundColor,
      this.activeColor,
      this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    final colorsMenu = Provider.of<_MenuModel>(context);

    final selectItem = Provider.of<_MenuModel>(context).indexSelect;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).indexSelect = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (selectItem == this.index) ? 35 : 25,
          color: (selectItem == this.index)
              ? colorsMenu.activeColor
              : colorsMenu.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _indexSelect = 0;
  Color _activeColor = Colors.red;
  Color _inactiveColor = Colors.blueGrey;
  Color _backgroundColor = Colors.white;

  Color get activeColor => this._activeColor;

  set activeColor(Color activeColor) {
    this._activeColor = activeColor;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color inactiveColor) {
    this._inactiveColor = inactiveColor;
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color backgroundColor) {
    this._backgroundColor = backgroundColor;
  }

  int get indexSelect => this._indexSelect;

  set indexSelect(int indexSelect) {
    this._indexSelect = indexSelect;
    notifyListeners();
  }
}
