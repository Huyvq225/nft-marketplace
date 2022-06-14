import 'dart:io';

String resource(String name) => File('test/resources/$name').readAsStringSync();
