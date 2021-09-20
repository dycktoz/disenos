import 'package:flutter/material.dart';


class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesR extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35 );
    path.lineTo(size.width, size.height * 0.30 );
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0 );

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.50 );
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0 );

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.50 );
    path.lineTo(0, size.height * 0.25 );
    path.lineTo(size.width * 0.5, size.height * 0.33 );
    path.lineTo(size.width, size.height * 0.25 );
    path.lineTo(size.width, 0 );

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.50 );
    path.lineTo(0, size.height * 0.20 );
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40 , size.width, size.height * 0.20 );
    path.lineTo(size.width, 0 );


    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.50 );
    path.lineTo(0, size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35 , size.width * 0.5 , size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15 , size.width , size.height * 0.25 );
    path.lineTo(size.width, 0 );


    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset( 0.0, 55.0 ), 
      radius: 180,
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
        
      ],
      stops: [
        0.3,
        0.5,
        1.0,
      ],
    );

    final paint = new Paint()..shader = gradiente.createShader(rect);

    //paint.color = Colors.red;
    paint.style = PaintingStyle.fill;  //.stroke
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.50 );
    path.lineTo(0, size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35 , size.width * 0.5 , size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15 , size.width , size.height * 0.25 );
    path.lineTo(size.width, 0 );


    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class IconHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(),
        Positioned(
          child: Icon(Icons.add, size: 250, color: Colors.white,)
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526BF6),
            Color(0xff67ACF2)
          ]
        ),
      ),
    );
  }
}
