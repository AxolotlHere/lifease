import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lifease/model/UserModel.dart';

class Dbcontroller {
  static void createUser(String name,String email,String password,int age,double weight,double height, int w_index,int s_index,double vac_time, int nw_rule, int hobbies_bool, int better_life, bool tc_agreed,int gender) async{
    print(Usermodel.formatData(
        name: name, w_hrs: w_index,weight: weight,height: height,exercise_scale: {"steps":{},"water":{},"sleep":{},"screentime":{}}, slp_hrs: s_index,no_work: nw_rule==0?false:true,vac_status: vac_time, email: email,password: password  
      ));
    final creds = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.replaceAll(",", "."), password: password).then((onValue){
    });
    DatabaseReference ref = FirebaseDatabase.instance.refFromURL(
      "https://lifease-dbaa9-default-rtdb.firebaseio.com/"
    );
    String formatted_email = email.replaceAll(".", ",");
    DateTime date_ = DateTime.now();
    print(Usermodel.formatData(
        name: name, w_hrs: w_index,weight: weight,height: height,exercise_scale: {"steps":{"${date_.day}:${date_.month}:${date_.year}":0},"water":{"${date_.weekday}:${date_.month}:${date_.year}":0},"sleep":{"${date_.weekday}:${date_.month}:${date_.year}":0},"screentime":{"${date_.weekday}:${date_.month}:${date_.year}":0}}, slp_hrs: s_index,no_work: nw_rule==0?false:true,vac_status: vac_time, email: email,password: password
      ));
    await ref.child(formatted_email).set(
      Usermodel.formatData(
        name: name, w_hrs: w_index,weight: weight,height: height,exercise_scale: {"steps":{"${date_.day}:${date_.month}:${date_.year}":0},"water":{"${date_.day}:${date_.month}:${date_.year}":0},"sleep":{"${date_.day}:${date_.month}:${date_.year}":0},"screentime":{"${date_.day}:${date_.month}:${date_.year}":0}}, slp_hrs: s_index,no_work: nw_rule==0?false:true,vac_status: vac_time, email: email,password: password
      )
    );  
  }
  static Future<Map> readData(String email) async{
      String formatted_email = email.replaceAll(".", ",");
    final snapshot = await FirebaseDatabase.instance
        .refFromURL(
            "https://lifease-dbaa9-default-rtdb.firebaseio.com/")
        .child("$formatted_email")
        .get();
    if (snapshot.exists) {
      return Map.from(snapshot.value as dynamic);
    } else {
      return {"NIL": "NIL"};
    }
      
    }
}
