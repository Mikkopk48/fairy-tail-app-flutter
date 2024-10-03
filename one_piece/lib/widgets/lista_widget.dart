import 'package:fairy_tail/src/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Listapersonajes extends StatefulWidget {
  const Listapersonajes({super.key});

  @override
  State<Listapersonajes> createState() => _ListapersonajesState();
}

class _ListapersonajesState extends State<Listapersonajes> {
  double widthScreen = 0;
  final tituloStyletext = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width - 50;

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            "Portadas",
            style: tituloStyletext,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              bloquesPortada("portada1.png", "temporada1", "2018"),
              SizedBox(
                width: widthScreen * 0.03,
              ),
              bloquesPortada("portada2.png", "temporada2", "2022"),
              SizedBox(
                width: widthScreen * 0.03,
              ),
              bloquesPortada("portada3.png", "temporada3", "2023"),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
            color: Color.fromARGB(255, 123, 120, 120),
          ),
          const SizedBox(
            height: 20,
          ),
          bloquePersonajes("Lucy", 0xffFFCB28, "lucy2-rb"),
          bloquePersonajes("Erza", 0xffF82A2D, "erza2-rb"),
          bloquePersonajes("Natsu", 0xffFE4649, "natsu-rb"),
          bloquePersonajes("Lluvia", 0xffDF1C6A, "lluvia2-rb"),
          bloquePersonajes("Grey", 0xff4913C4, "grey-rb"),
          bloquePersonajes("Happy", 0xff21E295, "happy-rb"),
        ],
      ),
    );
  }

  Widget bloquePersonajes(String nombre, int color, String image) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.of(context).push(CupertinoPageRoute(
          builder:(context)=>DetallePage(color: color,image: "assets/$image.png",nombre: nombre,)))
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 42, 39, 39)),
          height: 65,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-8,5),
                          spreadRadius: 0,
                          blurStyle: BlurStyle.normal,
                          color: Color(color),
                        ),
                      ],borderRadius: BorderRadius.circular(20)
                    ),
                    padding: const EdgeInsets.all(8),
                    child:Hero(tag:"Origen",child: Image.asset("assets/$image.png")),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(nombre,style: const TextStyle(fontSize:16,color: Colors.white),)
                ],
              ),
            IconButton(onPressed: ()=>{},
          icon:const Icon(Icons.more_vert_rounded,color:Colors.grey))
            ],
          ),
        ),
    );
  }

  Widget bloquesPortada(String image, String titulo, String subtitulo) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/$image',
            width: widthScreen * 0.31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
            text: titulo,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            children: [
              
              TextSpan(
                text: subtitulo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,)
                ),
            ],
          ),
        ),
      ],
    );
  }
}
