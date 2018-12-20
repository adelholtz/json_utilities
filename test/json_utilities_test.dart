import 'package:flutter_test/flutter_test.dart';
import 'package:json_utilities/json_utilities.dart';

void main() {
  test('test root and leaf values', () {
    var json = <String, dynamic>{
      'root': 'value',
      'root2': <String, dynamic>{'leaf': 'fruit'}
    };

    String value;
    value = JSONUtils().get(json, 'root', 'defaultValue');
    assert(value == 'value');

    value = JSONUtils().get(json, 'root.leaf', 'defaultValue');
    assert(value == 'defaultValue');

    var dynamicValue = JSONUtils().get(json, 'root2', 'defaultValue');
    assert(dynamicValue.runtimeType.toString() == '_InternalLinkedHashMap<String, dynamic>' );

    value = JSONUtils().get(json, 'root2.leaf', 'defaultValue');
    assert(value == 'fruit');

    value = JSONUtils().get(json, 'root2.leaf.leaf2.deepleaf', 'defaultValue');
    assert(value == 'defaultValue');
  });
}
