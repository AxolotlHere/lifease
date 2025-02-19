class Usermodel {
  static Map<String,dynamic> formatData({required int w_hrs,
  required double weight,
  required double height,
  required int exercise_scale,
  required int slp_hrs,
  required bool no_work,
  required int vac_status,
  required int steps,
  required int observed_sleep_patterns,
  }){
    return {
      "w_hrs":w_hrs,
      "weight":weight,
      "height":height,
      "exercise_scale":exercise_scale,
      "slp_hrs":slp_hrs,
      "no_work":no_work,
      "vac_status":vac_status,
      "steps":steps,
      "observed_sleep_patterns":observed_sleep_patterns
    };
  }
}