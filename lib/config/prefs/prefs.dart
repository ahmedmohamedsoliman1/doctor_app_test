import 'package:shared_preferences/shared_preferences.dart';

class InitPrefs {

 static late SharedPreferences prefs ;
 static late SharedPreferences prefs1 ;

 static init() async{
   prefs = await SharedPreferences.getInstance();
   prefs1 = await SharedPreferences.getInstance();
   print("init");
 }

 static Future <bool> saveString ({
   required String key ,
   required String value
}) async {

   return await prefs.setString(key, value);
 }

 static String? getString ({
   required String key
}) {
   return prefs.getString(key);
 }
}