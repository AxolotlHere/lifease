import 'package:flutter/material.dart';
import 'package:lifease/SignIn.dart';
import 'package:lifease/backend/dbController.dart';
import 'package:lifease/questions.dart';


class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScaffold(),
    );
  }
}

class SignupScaffold extends StatefulWidget {
  SignupScaffold({super.key});

  @override
  State<SignupScaffold> createState() => _SignupScaffoldState();
}

class _SignupScaffoldState extends State<SignupScaffold> {
  String email = "";
  String password = "";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(2,4,10, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(height: 100,width: 100,margin: EdgeInsets.only(top: 10,left: 10),decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("SIGN UP  ,",style: TextStyle(fontFamily: "Rubik_title",fontSize: 25,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("IT'S COMPLETELY FREE",style: TextStyle(fontFamily: "Rubik_title",fontSize: 16,color: Colors.white),),
              ),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("NAME",style: TextStyle(fontFamily: "Rubik_content",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(padding: EdgeInsets.only(left: 7.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                child: TextField(
                  style: TextStyle(fontFamily: "Rubik_content",fontSize: 15,color: Colors.white,fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: Color.fromRGBO(5,5,5,1),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(20, 184, 129, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                      
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                  onChanged: (onValue){
                    name = onValue;
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("EMAIL ID",style: TextStyle(fontFamily: "Rubik_content",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(padding: EdgeInsets.only(left: 7.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                child: TextField(
                  style: TextStyle(fontFamily: "Rubik_content",fontSize: 15,color: Colors.white,fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: Color.fromRGBO(5,5,5,1),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(20, 184, 129, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                      
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                  onChanged: (onValue) {
                    email = onValue;
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("PASSWORD",style: TextStyle(fontFamily: "Rubik_content",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(padding: EdgeInsets.only(left: 7.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                child: TextField(
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: TextStyle(fontFamily: "Rubik_content",fontSize: 15,color: Colors.white,fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: Color.fromRGBO(5,5,5,1),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(20, 184, 129, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                  onChanged: (onValue) {
                    password = onValue;
                  },
                ),
              ),),
              Center(
                child: Padding(padding: EdgeInsets.only(top:40),
                child: ElevatedButton(onPressed: () {
                  print("name: ${name}");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionPages(email: email, password: password,name: name,)));
                }, child: Text("SIGN UP",style: TextStyle(fontFamily: "Rubik_content",fontSize:16,color: Colors.white,fontWeight: FontWeight.w800)),style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(20,184,129, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  shadowColor: Colors.black,
                ),),),
              ),
                Center(
                  child: ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
                  },child: Text("Already have an account? Sign In",style: TextStyle(fontFamily: "Rubik_content",decoration: TextDecoration.underline,decorationColor: Color.fromRGBO(20,184,129, 1),fontSize:13,color: Color.fromRGBO(20,184,129, 1),fontWeight: FontWeight.w900)),style: ElevatedButton.styleFrom(
                    overlayColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    shadowColor: Colors.black,
                  ),),),
              
            ],
          ),         
        )
      );
  }
}