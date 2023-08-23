import 'package:astro_guide/essential/Essential.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimezoneConstants {
  static tz.Location location = tz.getLocation("GMT");
  static tz.Location currLocation = Essential.getLocationFromOffset(DateTime.now().timeZoneOffset.inMinutes, DateTime.now().timeZoneName)??location;
}