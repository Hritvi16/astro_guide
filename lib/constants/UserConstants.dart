import 'package:astro_guide/constants/CommonConstants.dart';

class UserConstants {
  static String name = CommonConstants.name;
  static String code = "code";
  static String mobile = CommonConstants.mobile;
  static String email = CommonConstants.email;
  static String fcm = CommonConstants.fcm;
  static String nationality = "nationality";
  static String dob = "dob";
  static String gender = "gender";
  static String ci_id = "ci_id";
  static String F = "FEMALE";
  static String M = "MALE";
  static String joined_via = "joined_via";
  static String postal_code = "postal_code";
  static Map<String, String> jv = {
    "C" : "CUSTOM",
    "G" : "GOOGLE",
    "A" : "APPLE",
    "F" : "FACEBOOK"
  };
}