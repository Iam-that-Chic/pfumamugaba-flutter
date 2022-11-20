
import 'package:flutter/foundation.dart';

class Mukando with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double target;
  final String enddate;

  Mukando({
    required this.id,
    required this.title,
    required this.description,
    required this.target,
    required this.enddate,
  });

}
