





import 'package:flutter/material.dart';
import 'package:social/pages/home_page.dart';
import 'package:social/pages/sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Supabase.initialize(
   url: 'https://hjspqzjygabvznddswqq.supabase.co',
   publishableKey: 'sb_publishable_JLIbmBUncG9zjQEhpnAkVw_IXEsFfN1',
 );
 runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home: Supabase.instance.client.auth.currentSession!=null 
    ?HomePage()
    : SignInPage(),
    );
  }
}