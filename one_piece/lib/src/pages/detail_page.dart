import 'package:fairy_tail/src/animations/fade_animation.dart';
import 'package:fairy_tail/widgets/blur_container.dart';
import 'package:fairy_tail/widgets/infotitle_widget.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({super.key, required this.color,
  required this.image,required this.nombre});
  final int color;
  final String image;
  final String nombre;

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(widget.color), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                height:screenHeight*0.6,
                child: Image.asset(widget.image)
                ),
            ),
      Positioned(
        bottom: 10,
        left: 18,
        child: FadeAnimation(
          intervalEnd:0.1 ,
          child: BlurContainer(
          child: Container(
          width: 160,
          height: 50,
          alignment:Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.3),
          ),
                child: Text(widget.nombre,style: const TextStyle(
          fontWeight: FontWeight.bold,fontSize: 18,
          color:Colors.white
                ),),
                ),),
        )),
      ], 
      ),
      const SizedBox(height: 30),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0)
      ,child: FadeAnimation(
        intervalStart:0.3 ,
        child: Text(
          "${widget.nombre} #personaje",style: const
          TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
      ),),
      const SizedBox(height: 5),
      const Padding(padding:EdgeInsets.symmetric( horizontal:8.0),
      child: FadeAnimation(
        intervalStart: 0.15,
        child: Text(
          "Fairy Tail",
          style:TextStyle
          (color: Colors.white70)),
      ),), 
      const SizedBox(height: 50),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 8),
      child:FadeAnimation(
        intervalStart:0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment
          .spaceBetween,children: [
          Infotitle(title: "Hiro Mashima", subtitle: "Creador"),
          Infotitle(title: "Japon", subtitle: "Pais"),
          ],
        ),
      ),),
      const Spacer(),
      FadeAnimation(
        intervalStart: 0.2,
        child: GestureDetector(
          onTap:()=>{Navigator.pop(context)},
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            margin:  const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(widget.color)
            ),child: const Text(
              "Volver",
              style:TextStyle(
              color:Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            
          ),
        ),
      )
      ],
      ),
      ),
    );
  }
}
