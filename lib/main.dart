import 'package:flutter/material.dart';

import 'random_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final appName = 'Name Picker';

  @override
  Widget build(BuildContext context) {
    // App's logic

    // The final app to be rendered is bellow
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(fontFamily: 'Mali'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: const Center(child: RandomWords()),
      ),
    );
  }
}




// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
