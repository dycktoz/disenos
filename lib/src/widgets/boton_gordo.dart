import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BotonGordo extends StatelessWidget {

  final IconData icon;
  @required final String texto;
  final Color color1;
  final Color color2;
  @required final Function onpress;

  const BotonGordo({
  this.icon= FontAwesomeIcons.circle, 
  this.texto, 
  this.color1 = Colors.grey,
  this.color2 = Colors.blueGrey, 
  this.onpress,
  });
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onpress,
      child: Stack(
        children: [
          _BotonGordoBackground(this.icon, this.color1, this.color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox( height: 140, width: 40,),
              FaIcon(this.icon, color: Colors.white, size: 40,),
              SizedBox( width: 20,),
              Expanded( child: Text(this.texto , style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white,),
              SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon, size: 150, color: Colors.white.withOpacity(0.2),))
          ],
        ),
      ),
     width: double.infinity,
     height: 100,
     margin: EdgeInsets.all(10),
     decoration: BoxDecoration(
      color: Colors.red,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity((0.2)), offset: Offset(4,6), blurRadius: 10,),
      ],
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        colors: 
        [
          this.color1,
          this.color2,
        ]
        )

     ),
    );
  }
}