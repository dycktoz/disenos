import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CircularProgressPage extends StatefulWidget {

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  
  AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPcentaje = 0.0;

  @override
  void initState() {

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() { 

/*        print('valor controller: ${ controller.value}'); */
 
      setState(() {
      porcentaje = lerpDouble(porcentaje, nuevoPcentaje, controller.value);
      });

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
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){

          porcentaje = nuevoPcentaje;
          nuevoPcentaje += 10;
          if (nuevoPcentaje > 100){
            nuevoPcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);

          setState(() {
            
          });
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( porcentaje ),
          ),
        ),
      ),
    );
  }

}


class _MiRadialProgress extends CustomPainter {

   final porcentaje;

   _MiRadialProgress( this.porcentaje);


  @override
  void paint(Canvas canvas, Size size) {


    //circulo completado
    final paint = new Paint()
     ..strokeWidth = 4
     ..color       = Colors.grey
     ..style       = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height / 2 );
    final radio  =min(size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
     ..strokeWidth = 10
     ..color       = Colors.orange
     ..style       = PaintingStyle.stroke;
    
    //Parte que se llenara
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}