// paquetería de material design para importacion de paquetes
// hace que todo lo demas funcione, es tu método main
// StatelessWidget es el padre de los widgets
// MyApp hereda de StatelessWidget
// ignore: todo
// TODO ES UN WIDGET
  // método build se encarga de construir en el Widget MyApp todo lo de adentro
  // return MaterialApp toma todos los elementos de material design
  // home es la estructura de la app, su composision
  // el scaffold se compone de la estructura de la app, (componentes)
// ignore: unused_import
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'platzi_trips.dart';
// ignore: unused_import
import 'platzi_trips_cupertino.dart';
//quitando la barra de arriba en android
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/screens/sign_in_screen.dart';

// hace que todo lo demas funcione, es tu método main
void main() async {
  // inicializando la app desde firebase y luego nuestra app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// StatelessWidget es el padre de los widgets
// MyApp hereda de StatelessWidget
// ignore: must_be_immutable
class MyApp extends StatelessWidget {

    String title = "Popular";
  // This widget is the root of your application.
  @override
  
  // ignore: todo
  // TODO ES UN WIDGET
  // método build se encarga de construir en el Widget llamado MyApp todo lo de adentro
  Widget build(BuildContext context) {
    //quitando la barra de arriba en android
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      )
    );

    return BlocProvider(
      //q widget hijo quiero exponer
      child: MaterialApp(
        title: 'Flutter Demo',
        //routes: {},
        // home es la estructura de la app, su composision
          // Scafold es como una pestaña
        home: SignInScreen(),
        // PlatziTripsCupertino(), es lo mismo q PlatziTrips pero para ios
      ),
      //q bloc expondremos
      bloc: UserBloc(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // el scaffold se compone de la estructura de la app (componentes en el lugar que corresponde)
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
