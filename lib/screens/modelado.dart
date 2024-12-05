import 'package:conia/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Modelado extends StatelessWidget {
  const Modelado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ModelViewer(
            backgroundColor: bgcolor,
            src: 'assets/burguiir.glb',
            alt: 'A 3D model of an astronaut',
            ar: true,
            autoRotate: true,
            disableZoom: true,
        
      ),
    );
  }
}