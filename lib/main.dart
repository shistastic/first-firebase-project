import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/screens/wrapper.dart';
import 'package:shopping_list/services/auth.dart';
import 'model/user.dart';


Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
