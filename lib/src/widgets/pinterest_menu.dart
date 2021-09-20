import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton{
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed, 
    @required this.icon });

}


class PinterestMenu extends StatelessWidget {

  final bool mostar;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;


  PinterestMenu({
    this.mostar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
  });

  //final List<PinterestButton> items =[
  //  PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart');}),
  //  PinterestButton(icon: Icons.search, onPressed: (){ print('search');}),
  //  PinterestButton(icon: Icons.notifications, onPressed: (){ print('notifications');}),
  //  PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('supervised_user_circle');}),
  //];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MEnuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MEnuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MEnuModel>(context).activeColor = this.activeColor;
            Provider.of<_MEnuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackgound(
            chidl: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackgound extends StatelessWidget {

  final Widget chidl;

  _PinterestMenuBackgound({@required this.chidl});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MEnuModel>(context).backgroundColor;

    return Container(
      child: chidl,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            //offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5,
          )
        ]
      ),
    );
  }
}
class _MenuItems extends StatelessWidget {
  
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  List.generate(menuItems.length , (i) => _PinterestmenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestmenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestmenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MEnuModel>(context).itemSeleccionado;
    
    final menuModel = Provider.of<_MEnuModel>(context);

    
    return GestureDetector(
      onTap: (){
        Provider.of<_MEnuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MEnuModel with ChangeNotifier{
  int _itemSeleccionado = 0;

  Color backgroundColor   = Colors.white;
  Color activeColor       = Colors.black;
  Color inactiveColor      = Colors.blueGrey;   

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }
}