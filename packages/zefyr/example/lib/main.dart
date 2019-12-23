// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'src/form.dart';
import 'src/full_page.dart';
import 'src/view.dart';

void main() {
  runApp(ZefyrApp());
}

class ZefyrApp extends StatefulWidget {
  @override
  _ZefyrAppState createState() => _ZefyrAppState();
}

class _ZefyrAppState extends State<ZefyrApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zefyr Editor',
      theme: ThemeData(primarySwatch: Colors.cyan),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: isDarkMode,
        toggleDarkMode: (v) {
          setState(() {
            isDarkMode = v;
          });
        },
      ),
      routes: {
        "/fullPage": buildFullPage,
        "/form": buildFormPage,
        "/view": buildViewPage,
      },
    );
  }

  Widget buildFullPage(BuildContext context) {
    return FullPageEditorScreen();
  }

  Widget buildFormPage(BuildContext context) {
    return FormEmbeddedScreen();
  }

  Widget buildViewPage(BuildContext context) {
    return ViewScreen();
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleDarkMode;

  HomePage({this.isDarkMode, this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        brightness: Brightness.light,
        title: ZefyrLogo(),
        actions: <Widget>[
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              toggleDarkMode(value);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          FlatButton(
            onPressed: () => nav.pushNamed('/fullPage'),
            child: Text('Full page editor'),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
          FlatButton(
            onPressed: () => nav.pushNamed('/form'),
            child: Text('Embedded in a form'),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
          FlatButton(
            onPressed: () => nav.pushNamed('/view'),
            child: Text('Read-only embeddable view'),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
