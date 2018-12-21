# json_utilities

Dart/Flutter package to enhance the experience of working with json based models.

Can be used in conjunction with [json_serializable](https://pub.dartlang.org/packages/json_serializable).

See Examples for more details.

## General Idea
The general/basic idea was to have something similar like lodash or ramda when working with 'JSON' / Map<String,dynamic>
in Dart.

Some operations like checking for existence of certain JSON leafs can be tedious, that's where this package is
supposed to come in and save the day!

**This is a growing library, contributions are welcome!**

## Usage

To use this plugin, add json_utilites as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)

## Examples

### Basic Example

```dart
import 'package:json_utilities/json_utilities.dart';

var json = <String, dynamic>{
  'root': 'value',
  'root2': <String, dynamic>{'leaf': 'fruit'}
};

JSONUtils().get(json,'root.leaf', 'defaultValue') // returns String defaultValue
JSONUtils().get(json,'root', 'defaultValue') // returns String value
JSONUtils().get(json,'root2', 'defaultValue') // <String, dynamic>{'leaf': 'fruit'}
JSONUtils().get(json,'root.leaf.deeperLeaf', 'defaultValue') / returns String defaultValue
```

### json_serializable Example

```dart
// model/Condition.dart
import 'package:json_annotation/json_annotation.dart';

part 'Condition.g.dart';

@JsonSerializable()
class Condition {

  String text;
  String language;

  Condition({this.text,this.language});

  /*
   * Json to Location object
   */
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  /*
   * Location object to json
   */
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

}
```

```dart
import 'package:json_utilities/json_utilities.dart';
import 'model/Condition.dart';

Foo{
    Condition condition;

    FOO(this.condition);

    getLanguage(){
       return JSONUtils().get(condition.toJson(),'language', 'none');
    }
}
```