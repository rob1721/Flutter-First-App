//aca vamos a contener toda la logica, toda la app
//la cual sera llamada en el main en lugar del body/scaffold
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips>{

  //indice para acceder a cada elemento de la lista
  int indexTap = 0;
  //añadiendo la lista de taps (los iconos)
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips(),
  ];
  //añadiendo la parte de navegacion
  void onTapTapped(int index /*cada boton del indice tiene una ubicacion*/) {
    //controlando el estado del widget
    setState(() {
      indexTap = index; //mostrando el indice
    });
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    );
    
    return Scaffold(
      //añadiendo los taps q queremos
      body: widgetsChildren[indexTap],
      //bottonNavigationBar casual "normalito"
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.indigo
          ), //la diferencia q queremos
          child: BottomNavigationBar(
            //q sucedera cuando alguien le de TAP
            onTap: onTapTapped,
            //añadiendo index
            currentIndex: indexTap, //al tap automaticamente le pasara el index
            //items[] esta indexado y se asigna a cada posicion un widget
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(""),
              )
            ]//los tabs del buttonnavigation

          )
        ),
      );
  }
  
}