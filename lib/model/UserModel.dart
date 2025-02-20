class Usermodel {
  static Map<String,dynamic> formatData({required String name,required int w_hrs,
  required double weight,
  required double height,
  required Map exercise_scale,
  required int slp_hrs,
  required bool no_work,
  required double vac_status,
  required String email,
  required String password,
  }){
    return {
      "name":name,
      "email":email,
      "password":password,
      "w_hrs":w_hrs,
      "weight":weight,
      "height":height,
      "exercise_scale":exercise_scale,
      "slp_hrs":slp_hrs,
      "no_work":no_work,
      "vac_status":vac_status,
    };
  }
}