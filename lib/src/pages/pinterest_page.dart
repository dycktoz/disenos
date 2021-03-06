import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu(),
        //body: PinterestGrid(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;


    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinterestMenu(
            mostar: mostrar,
            //activeColor: Colors.red,
            //inactiveColor: Colors.blue,
            //backgroundColor: Colors.red,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart');}),
              PinterestButton(icon: Icons.search, onPressed: (){ print('search');}),
              PinterestButton(icon: Icons.notifications, onPressed: (){ print('notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('supervised_user_circle');}),
            ],
          ),
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {

      if (controller.offset > scrollAnterior && controller.offset > 150){
        Provider.of<_MenuModel>(context, listen: false, ).mostar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false, ).mostar = true;
      }

      scrollAnterior = controller.offset;

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
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3 ),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}


class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostar( bool valor){
    this._mostrar = valor;
    notifyListeners();
  }
}