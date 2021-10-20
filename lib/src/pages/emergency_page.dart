import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';
import 'package:animate_do/animate_do.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  ];

    List<Widget> itemMAp = items.map(
      (item) => FadeInLeft(
        duration: Duration(milliseconds: 250),
        child: BotonGordo(
          icon: item.icon,
          texto: item.texto,
          color1: item.color1,
          color2: item.color2,
          onpress: (){print('hola');},
        ),
      )
      ).toList();

    return Scaffold(

      body: Stack(
        children: [

          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 80,),
                ...itemMAp
              ],
            ),
          ),
          _Encabezado()
        ],
      ),
   );
  }
}

class _Encabezado extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'titulo', 
          subtitulo: 'subtitulo' ,
          color2: Color(0xff66A9F2),
          color1: Color(0xff536CF6),
          ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: 'uwu',
      icon: FontAwesomeIcons.carCrash,
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onpress: (){print('Click!');},
    );
  }
}

class PageHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'subtitulo',
      titulo: 'titulo',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}