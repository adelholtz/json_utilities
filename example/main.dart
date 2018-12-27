import 'package:json_utilities/json_utilities.dart';

var json = <String, dynamic>{
  'root': 'value',
  'root2': <String, dynamic>{'leaf': 'fruit'}
};

String value = JSONUtils().get(json,'root.leaf', 'defaultValue');