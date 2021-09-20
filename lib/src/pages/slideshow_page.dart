import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Column(
        children: [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow()),
        ],
      )
    );
  }
}

class MiSlideShow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario : 20,
      bulletSecundario: 12,
      //puntosArriba: true,
      colorPrimario: Color(0xffFF5A7E),
      //colorSecundario: Colors.red,
      slides: [
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),          
      ],
    );
  }
}