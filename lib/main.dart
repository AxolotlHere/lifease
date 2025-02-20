import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lifease/SignIn.dart';
import 'package:lifease/firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
    runApp(HomePage());
}


class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScaffold(),
    );
  }
}

class HomePageScaffold extends StatefulWidget {
  const HomePageScaffold({super.key});

  @override
  State<HomePageScaffold> createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(2,4,10, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Container(height: 300,width: 300,margin: EdgeInsets.only(top: 50),decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("LIF",style: TextStyle(fontFamily: "Rubik_title",fontSize: 40,color: Colors.white),),
                  ),
                  Text("E",style: TextStyle(fontFamily: "Rubik_title",fontSize: 50,color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top:5),
                    child: Text("ASE",style: TextStyle(fontFamily: "Rubik_title",fontSize: 40,color: Colors.white),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  8.0),
                child: Text("Your personal guide to guide a healthy life",style: TextStyle(fontFamily: "Rubik_content",fontSize: 16,color: Colors.white,),textAlign: TextAlign.center),
              ),
              Padding(padding: EdgeInsets.all(8),
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
              }, child: Text("GET STARTED",style: TextStyle(fontFamily: "Rubik_content",fontSize:16,color: Colors.white,fontWeight: FontWeight.w800)),style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(20,184,129, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 100,
                shadowColor: Colors.black,
              ),),)
            ],
          ),
        )
      );
  }
}