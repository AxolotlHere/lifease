import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifease/SignUp.dart';
import 'package:lifease/mainPage.dart';


class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScaffold(), 
    );
  }
}

class SignInScaffold extends StatefulWidget {
  SignInScaffold({super.key});

  @override
  State<SignInScaffold> createState() => _SignInScaffoldState();
}

class _SignInScaffoldState extends State<SignInScaffold> {
  String email = "";
  String password = "";
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
              Container(height: 100,width: 100,margin: EdgeInsets.only(top: 75,left: 10),decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("WELCOME BACK,",style: TextStyle(fontFamily: "Rubik_title",fontSize: 25,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("SIGN IN TO CONTINUE",style: TextStyle(fontFamily: "Rubik_title",fontSize: 16,color: Colors.white),),
              ),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("EMAIL ID",style: TextStyle(fontFamily: "Rubik_content",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(padding: EdgeInsets.only(left: 7.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                child: TextField(
                  onChanged: (changedValue){
                    email = changedValue;
                  },
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
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("PASSWORD",style: TextStyle(fontFamily: "Rubik_content",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(padding: EdgeInsets.only(left: 7.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
                child: TextField(
                  onChanged: (onValue){
                    password = onValue;
                  },
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
                ),
              ),),
              Center(
                child: Padding(padding: EdgeInsets.only(top:40),
                child: ElevatedButton(onPressed: 
                  () async{
                    print("called");
                    try{
                      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage(e_mail: email,)));
                    }on FirebaseAuthException catch (e){
                      if(e=="user-not found"){
                        showDialog(context: context, builder: (ctx) => AlertDialog(title: Text(""),content: Text("User with that email not found, please register"),actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        color: Colors
                                                                            .blue,
                                                                        padding:
                                                                            EdgeInsets.all(14),
                                                                        child: Text(
                                                                            "Okay"),
                                                                      ))
                                                                ],));
                      }else{
                        showDialog(context: context, builder: (ctx) => AlertDialog(title: Text(""),content: Text("Some error occured, please check"),actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        color: Colors
                                                                            .blue,
                                                                        padding:
                                                                            EdgeInsets.all(14),
                                                                        child: Text(
                                                                            "Okay"),
                                                                      ))
                                                                ],));
                      }
                      
                  };
                  
                }, child: Text("SIGN IN",style: TextStyle(fontFamily: "Rubik_content",fontSize:16,color: Colors.white,fontWeight: FontWeight.w800)),style: ElevatedButton.styleFrom(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));  
                  },child: Text("Don't have an account? Sign Up",style: TextStyle(fontFamily: "Rubik_content",decoration: TextDecoration.underline,decorationColor: Color.fromRGBO(20,184,129, 1),fontSize:13,color: Color.fromRGBO(20,184,129, 1),fontWeight: FontWeight.w900)),style: ElevatedButton.styleFrom(
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