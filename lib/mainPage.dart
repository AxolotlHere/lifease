
import 'package:flutter/material.dart';
import 'package:lifease/backend/dbController.dart';
import 'package:lifease/main.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/percent_indicator.dart';

String email = "";
bool _isLoading = true;
Map user_data = {};
class MainPage extends StatefulWidget {
  String e_mail;
  MainPage({super.key,required this.e_mail}){
    email = e_mail;
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Dbcontroller.readData(email).then((onValue){
      print(onValue);
      setState(() {
        user_data = onValue;
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_isLoading?MainPageScaffold():Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.transparent, strokeWidth: 10.0, color: Colors.white)))
    );
  }
}

class MainPageScaffold extends StatefulWidget {
  MainPageScaffold({super.key});

  @override
  State<MainPageScaffold> createState() => _MainPageScaffoldState();
}

class _MainPageScaffoldState extends State<MainPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(2,4,10, 1),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50,height: 50,child: Image.asset("assets/img/logo_1.png")),
                  SizedBox(width: 50,height: 50,child: Image.asset("assets/img/image 9.png"))
                ],
              ), 
              Row(
                children: [
                  Container(margin: EdgeInsets.all(10),child: Image.asset("assets/img/image 2.png"),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: Color.fromRGBO(20,184,129,1),width: 4,)),),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Hey ${user_data["name"].toString().toLowerCase()},",style: TextStyle(fontFamily: "Nunito",fontSize: 20,color: Colors.white, fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
                        Text("Don't run a rat race, conduct one :)",style: TextStyle(fontFamily: "Nunito",fontSize: 10,color: Colors.white, fontWeight: FontWeight.w900),textAlign: TextAlign.start),
                      ],
                    ),
                  ) 
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Daily Goals",style: TextStyle(fontFamily: "Rubik_content",fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("HLI : 7",style: TextStyle(fontFamily: "Rubik_content",fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 2,left: 10),
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Steps",style: TextStyle(fontFamily: "Rubik_title",fontSize: 17,color: Color.fromRGBO(20,184,129,1),fontWeight: FontWeight.bold),),
                              ),
                              Padding(padding: EdgeInsets.all(8.0),
                              child: Image.asset("assets/img/Group 7.png"),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircularPercentIndicator(radius: 40.0,percent: 0.6,lineWidth: 8.0,fillColor: Colors.transparent,backgroundColor: Colors.white,progressColor: Color.fromRGBO(20,184,129,1),),
                          )
                        ],
                      ),
                    )  
                  ],
                ),
              )          
            ],
          ),
        ),
    );
  }
}