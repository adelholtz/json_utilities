# json_utilities

A new Flutter package.

## Usage

To use this plugin, add json_utilites as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)

## Example
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