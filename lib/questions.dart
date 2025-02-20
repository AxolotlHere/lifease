import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lifease/backend/dbController.dart';


class QuestionPages extends StatefulWidget {
  String email;
  String password;
  String name;
  QuestionPages({super.key, required this.email,required this.password, required this.name});

  @override
  State<QuestionPages> createState() => _QuestionPagesState(email: email,password: password, name: name);
}

class _QuestionPagesState extends State<QuestionPages> {
  String email;
  String password;
  String name;
  _QuestionPagesState({required this.email, required this.password, required this.name});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionPagesScaffold(email: email, password: password,name: name)
    );
  }
}

class QuestionPagesScaffold extends StatefulWidget {
  String email;
  String password;
  String name;
  QuestionPagesScaffold({super.key, required this.email,required this.password, required this.name});

  @override
  State<QuestionPagesScaffold> createState() => _QuestionPagesScaffoldState(email: email,password: password,name: name);
}

class _QuestionPagesScaffoldState extends State<QuestionPagesScaffold> {
  int index = 0;
  String email;
  String password;
  String name;
  int age = 0;
  int gender = 0;
  double weight = 0.0;
  double height = 0.0;
  final List<String> sleepOptions = [
    "2-5 hours",
    "5-8 hours",
    "8-12 hours",
    "12+ hours",
  ];
  final List<String> workOptions = [
    "2-5 hours",
    "5-8 hours",
    "8-12 hours",
    "12+ hours",
  ];
  int? workselectedIndex;
  int? sleepSelectedIndex;
  double vac_time = 0;
  int nw_rule = 1;
  int hobbies_bool = 1;
  int better_life = 1;
  bool tc_agreed = true;
 _QuestionPagesScaffoldState({required this.email,required this.password, required this.name});
  @override
  Widget build(BuildContext context) {
    List<Widget> QP_containers = <Widget>[
  Container(height: MediaQuery.of(context).size.height-100,child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(children: [
        Container(height: 50,width: 50,margin: EdgeInsets.only(top: 20,left: 20),decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                ),
              ),
        Container(padding: EdgeInsets.only(top: 10,left: 10),width: MediaQuery.of(context).size.width-100,child: LinearPercentIndicator(width: MediaQuery.of(context).size.width-120,lineHeight: 12,percent: (index+1)/6,backgroundColor: Colors.white,progressColor:Color.fromRGBO(20,184,129,1),barRadius: Radius.circular(10),))
      ],),
      Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("ENTER YOUR AGE",style: TextStyle(fontFamily: "Rubik",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
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
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("ENTER YOUR WEIGHT (in kg)",style: TextStyle(fontFamily: "Rubik",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
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
                    weight = double.parse(onValue);
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("ENTER YOUR HEIGHT (in cm)",style: TextStyle(fontFamily: "Rubik",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
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
                    height = double.parse(onValue);
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(top: 30,left: 15.0),
              child: Text("CHOOSE YOUR GENDER",style: TextStyle(fontFamily: "Rubik",fontSize:15,color: Colors.white,fontWeight: FontWeight.w800),),),
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: SegmentedButton(expandedInsets: EdgeInsets.zero,style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                          side: BorderSide(width: 10,color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 30),
                    selectedForegroundColor: Color.fromRGBO(35,35,35, 0),
                    selectedBackgroundColor: Color.fromRGBO(20,184,129,1),
                  ),segments: [ButtonSegment(value: 1,label: Text("MALE",style: TextStyle(fontFamily: "Rubik_title",fontSize: 10,color: Colors.white),)),ButtonSegment(value: 0,label: Text("FEMALE",style: TextStyle(fontFamily: "Rubik_title",fontSize: 10,color: Colors.white),)),ButtonSegment(value: -1,label: Text("OTHER",style: TextStyle(fontFamily: "Rubik_title",fontSize: 10,color: Colors.white),))], selected: {gender},
                  onSelectionChanged: (selectedValue) {
                    setState(() {
                      gender = selectedValue.first;
                    });
                  },),
          ),  
    ],
  ),),
  Container(
    height: MediaQuery.of(context).size.height-100,
    child: Column(
      children: [
          Row(children: [
            Container(height: 50,width: 50,margin: EdgeInsets.only(top: 20,left: 20),decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                    ),
                  ),
            Container(padding: EdgeInsets.only(top: 10,left: 10),width: MediaQuery.of(context).size.width-100,child: LinearPercentIndicator(width: MediaQuery.of(context).size.width-120,lineHeight: 12,percent: (index+1)/5,backgroundColor: Colors.white,progressColor:Color.fromRGBO(20,184,129,1),barRadius: Radius.circular(10),))
          ],),
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How long do you work on average?",
              style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Nunito", fontWeight: FontWeight.w900),textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true, // Allows ListView to take only necessary space
                physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
                itemCount: sleepOptions.length,
                itemBuilder: (context, index) {
                  bool isSelected = workselectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        workselectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.5),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: isSelected ? Color.fromRGBO(20 ,184 ,166,0.3) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: !isSelected? Colors.white: Color.fromRGBO(20 ,184 ,166,1), width: 2),
                      ),
                      child: Center(
                        child: Text(
                          sleepOptions[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      ]
    )
  ),
  Container(
    height: MediaQuery.of(context).size.height-100,
    child: Column(
      children: [
          Row(children: [
            Container(height: 50,width: 50,margin: EdgeInsets.only(top: 20,left: 20),decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                    ),
                  ),
            Container(padding: EdgeInsets.only(top: 10,left: 10),width: MediaQuery.of(context).size.width-100,child: LinearPercentIndicator(width: MediaQuery.of(context).size.width-120,lineHeight: 12,percent: (index+1)/6,backgroundColor: Colors.white,progressColor:Color.fromRGBO(20,184,129,1),barRadius: Radius.circular(10),))
          ],),
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How long do you sleep on average?",
              style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Nunito", fontWeight: FontWeight.w900),textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true, // Allows ListView to take only necessary space
                physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
                itemCount: sleepOptions.length,
                itemBuilder: (context, index) {
                  bool isSelected = sleepSelectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        sleepSelectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.5),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: isSelected ? Color.fromRGBO(20 ,184 ,166,0.3) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: !isSelected? Colors.white: Color.fromRGBO(20 ,184 ,166,1), width: 2),
                      ),
                      child: Center(
                        child: Text(
                          sleepOptions[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      ]
    )
  ),
  Container(
    height: MediaQuery.of(context).size.height-100,
    child: Column(
      children: [
          Row(children: [
            Container(height: 50,width: 50,margin: EdgeInsets.only(top: 20,left: 20),decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                    ),
                  ),
                  Container(padding: EdgeInsets.only(top: 10,left: 10),width: MediaQuery.of(context).size.width-100,child: LinearPercentIndicator(width: MediaQuery.of(context).size.width-120,lineHeight: 12,percent: (index+1)/6,backgroundColor: Colors.white,progressColor:Color.fromRGBO(20,184,129,1),barRadius: Radius.circular(10),))
          ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0),
            child: Text("How often do you go on vacations? (per year)",style: TextStyle(color: Colors.white,fontFamily: "Nunito",fontWeight: FontWeight.bold),),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Slider(value: vac_time, divisions: 6,onChanged: (value){
            setState(() {
              vac_time = value;
            });
          },thumbColor: Color.fromRGBO(20,184,129,1),
          activeColor: Color.fromRGBO(20,184,129,1),),
        ),
        Text("${(vac_time*6).toInt()}",style: TextStyle(color: Colors.white,fontFamily: "Rubik_title"),),
        Padding(
            padding: const EdgeInsets.only(top:40.0),
            child: Text("Do you have a strict \"no work after hours\" rule",style: TextStyle(color: Colors.white,fontFamily: "Nunito",fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SegmentedButton(style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                          side: BorderSide(width: 10,color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 30),
                    selectedForegroundColor: Color.fromRGBO(35,35,35, 0),
                    selectedBackgroundColor: Color.fromRGBO(20,184,129,1),
                  ),segments: [ButtonSegment(value: 1,label: Text("YES",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),)),ButtonSegment(value: 0,label: Text("NO",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),))], selected: {nw_rule},
                  onSelectionChanged: (selectedValue) {
                    setState(() {
            nw_rule = selectedValue.first;
                    });
                  },),
          ),
        Padding(
            padding: const EdgeInsets.only(top:40.0,left: 20,right: 20,bottom: 0),
            child: Text("Do you have hobbies or activities that help you unwind?",style: TextStyle(color: Colors.white,fontFamily: "Nunito",fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SegmentedButton(style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                          side: BorderSide(width: 10,color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 30),
                    selectedForegroundColor: Color.fromRGBO(35,35,35, 0),
                    selectedBackgroundColor: Color.fromRGBO(20,184,129,1),
                  ),segments: [ButtonSegment(value: 1,label: Text("YES",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),)),ButtonSegment(value: 0,label: Text("NO",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),))], selected: {hobbies_bool},
                  onSelectionChanged: (selectedValue) {
                    setState(() {
            hobbies_bool = selectedValue.first;
                    });
                  },),
          ),
          
      ]
    ),
  ),
  Container(
    height: MediaQuery.of(context).size.height-100,
    child: Column(
      children: [
          Row(children: [
            Container(height: 50,width: 50,margin: EdgeInsets.only(top: 20,left: 20),decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/img/logo_1.png"),fit: BoxFit.cover)
                    ),
                  ),
                  Container(padding: EdgeInsets.only(top: 10,left: 10),width: MediaQuery.of(context).size.width-100,child: LinearPercentIndicator(width: MediaQuery.of(context).size.width-120,lineHeight: 12,percent: (index+1)/6,backgroundColor: Colors.white,progressColor:Color.fromRGBO(20,184,129,1),barRadius: Radius.circular(10),))
          ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("We're almost done!\nThank you for staying in!",style: TextStyle(fontFamily: "Nunito",fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
          ),
          Image.asset("assets/img/image 1.png"),
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Text("I wish I had better work-life\nbalance",style: TextStyle(fontFamily: "Nunito",fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),            
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SegmentedButton(style: SegmentedButton.styleFrom(
              shape: RoundedRectangleBorder(
                          side: BorderSide(width: 10,color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    fixedSize: Size(50, 30),
                    selectedForegroundColor: Color.fromRGBO(35,35,35, 0),
                    selectedBackgroundColor: Color.fromRGBO(20,184,129,1),
                  ),segments: [ButtonSegment(value: 1,label: Text("YES",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),)),ButtonSegment(value: 0,label: Text("NO",style: TextStyle(fontFamily: "Rubik_title",fontSize: 15,color: Colors.white),))], selected: {better_life},
                  onSelectionChanged: (selectedValue) {
                    setState(() {
            better_life = selectedValue.first;
                    });
                  },),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 23,
                        child: Padding(
                          padding : EdgeInsets.only(left: 30,top: 5),
                          child: CheckboxListTile(contentPadding: EdgeInsets.zero,visualDensity: VisualDensity.compact,checkColor: Colors.white,activeColor: Color.fromRGBO(20,184,129,1),controlAffinity: ListTileControlAffinity.leading,value: tc_agreed,title: Text("I agree to all terms and conditions.",style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.white.withOpacity(0.3), decorationThickness: 2.5,decorationStyle: TextDecorationStyle.solid,fontFamily: "Nunito",fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),), onChanged: (onValue){
                            setState(() {
                              tc_agreed = onValue??false;
                              print("TC WHO : ${tc_agreed}");
                            });
                          }),
                        ),
                      )
                    ],
                  )
                  )
      ])),

];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(2,4,10, 1),
        child: Column(
          children: [
            QP_containers[index],
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child: ElevatedButton(onPressed: () {
                      setState(() {
                        index>0?index--:AlertDialog(title: Text("First Page Lul"),);
                      });
                    }, child: Text("BACK",style: TextStyle(fontFamily: "rubik_title",fontSize:14,color: Colors.white,fontWeight: FontWeight.bold)),style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(31, 34, 33, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: Colors.black,
                    ),),),
                    Padding(padding: EdgeInsets.all(8),
                    child: ElevatedButton(onPressed: () {
                      setState(() {
                        index<4?index++:Dbcontroller.createUser(name,email,password,age,weight,height,workselectedIndex!,sleepSelectedIndex!,vac_time,nw_rule,hobbies_bool,better_life,tc_agreed,gender);
                      });
                    }, child: Text(index==4?"SUBMIT":"NEXT",style: TextStyle(fontFamily: "rubik_title",fontSize:14,color: Colors.white,fontWeight: FontWeight.bold)),style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(20,184,129,1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      shadowColor: Colors.black,
                    ),),),
                ],
              ),
            ),
              
          ],
        ),        
      ),
    );
  }
}