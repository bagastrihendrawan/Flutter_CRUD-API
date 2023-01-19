import 'package:bootcamp_material/material/6_shop_list_app.dart';
import 'package:bootcamp_material/material/7_row_column_example.dart';
import 'package:bootcamp_material/material/module14_resources/implicit_animation.dart';
import 'package:bootcamp_material/material/nav_rout.dart';
import 'package:bootcamp_material/material/quis.dart';
// import 'package:bootcamp_material/net.dart';
import 'package:flutter/material.dart';

import 'package:bootcamp_material/material/12_navigating_routing.dart';
import 'package:bootcamp_material/material/14_animations.dart';
import 'package:bootcamp_material/material/15_state_management.dart';
import 'package:bootcamp_material/material/16_networking_http.dart';
import 'package:bootcamp_material/material/instagram_profile/profile_page.dart';
import 'package:bootcamp_material/material/6_basic_widgets.dart';
import 'package:bootcamp_material/material/6_button_example.dart';
import 'package:bootcamp_material/material/6_hello_world1.dart';
import 'package:bootcamp_material/material/6_hello_wrold2.dart';
import 'package:bootcamp_material/material/6_increment_app.dart';
import 'package:bootcamp_material/material/6_material_components.dart';
import 'package:bootcamp_material/material/8_first_app1.dart';
import 'package:bootcamp_material/material/8_first_app2.dart';
import 'package:bootcamp_material/material/9_module.dart';
import 'package:bootcamp_material/material/10_layout_practice.dart';
import 'package:bootcamp_material/material/11_interactive_state.dart';
import 'package:bootcamp_material/material/11_interactive_widget.dart';
import 'package:bootcamp_material/material/17_local_api.dart';

import 'material/commerce_app.dart';
import 'material/networking_http.dart';
import 'material/resume.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetworkingHttpApp(),
    );
  }
}

// via firebase
