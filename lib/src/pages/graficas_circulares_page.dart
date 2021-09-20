import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficaCircularesPage extends StatefulWidget {

  @override
  _GraficaCircularesPageState createState() => _GraficaCircularesPageState();
}

class _GraficaCircularesPageState extends State<GraficaCircularesPage> {

  double porcentaje = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.grey,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.brown,),
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  
  final Color color;
  
  const CustomRadialProgress({
    @required this.porcentaje, 
    @required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: RadialProgress( 
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: Colors.grey,
        grosorPrimario : 10,
        grosorsecundario: 4,
      ),
    );
  }
}