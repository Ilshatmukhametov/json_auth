import 'package:flutter/material.dart';
import 'package:untitled/pages/authentication.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/main',
      routes: {
        '/main': (context) => const MainMenuPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color.fromRGBO(234, 233, 234, 1.0)
        )
      ),
      title: 'Flutter Demo',
      home: const MainMenuPage(),
    );
  }

}

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}


class _MainMenuPageState extends State<MainMenuPage> {
  void _registr() {

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const testingPage(1)));
  }

  void _auth() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const testingPage(0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        backgroundColor: const Color.fromRGBO(234, 233, 234, 1.0),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 30,
                        child: Image(image: AssetImage('assets/homag.png'))
                      ),
                      Text(' HOMAG RUSSLAND',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30))
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text('Заказывайте запасные части не отходя от станка', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.7),textAlign: TextAlign.center),
                ],
              ),


              const SizedBox(height: 80),
              const Text('Если вы зарегестрированы на HOMAG RUSSLAND, используйте ваши логин и пароль для входа',style: TextStyle(fontSize: 12, color: Colors.grey),textAlign: TextAlign.center,),
              const SizedBox(height: 20),


              ElevatedButton(onPressed: _auth, child: const Text('Вход'),style: ElevatedButton.styleFrom(fixedSize: const Size(300, 20),),),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(color: Colors.grey,height: 1,width: 80,margin: const EdgeInsets.only(right: 15),),
                  const Text('или',style: TextStyle(color: Colors.grey, fontSize: 12),),
                  Container(color: Colors.grey,height: 1,width: 80,margin: const EdgeInsets.only(left: 15),),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _registr, child: const Text('Регистрация',style: TextStyle(color: Colors.blue),),style: ElevatedButton.styleFrom(primary: Colors.white,fixedSize: const Size(300, 20),),),
            ],
          ),
        )
    );
  }
}

