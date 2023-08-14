import 'dart:html'; // 导入dart内置库。
// import 'package:test/test.dart'; // 导入包管理的库，比如pub管理的库
import '015_class.dart'; // 通过文件路径导入库。每个dart程序都是一个库

// 以下划线（_）开头的成员仅在代码库中可见（下划线约定为私有）

// import 'package:lib2/lib2.dart' as lib2; // 给导入的库起个别名，一般不用
// lib2.Element element2 = lib2.Element(); // 可以解决名字冲突问题，一般不用加库名

// import 'package:lib1/lib1.dart' show foo; // 仅导入foo符号
// import 'package:lib2/lib2.dart' hide foo; // 导入除foo之外的符号