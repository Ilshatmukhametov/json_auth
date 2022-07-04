import 'package:flutter/material.dart';
import 'package:untitled/JSON/DataModel.dart';
import 'package:http/http.dart' as http;

class autho extends StatefulWidget {
  const autho({Key? key}) : super(key: key);

  @override
  State<autho> createState() => _authoState();
}


Future<DataModel> createUser(String login, String password) async {
  const String apiUrl = "http://gg-web.ru/api/auth.php";

  final response = await http.post(Uri.parse(apiUrl), body: {
    "login": login,
    "password": password
  });

  final String responseString = response.body;
  return dataModelFromJson(responseString);

}

class _authoState extends State<autho> {
  @override
  Widget build(BuildContext context) {

    DataModel? _data;
    TextEditingController _logController = TextEditingController();
    TextEditingController _passController = TextEditingController();

    return Container(
      width: double.maxFinite,
      height: 400,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text('Логин', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextField(
            controller: _logController,
            style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'Логин',
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(234, 233, 234, 1.0),
                  )
              ),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(234, 233, 234, 1.0),
                  )
              ),
              fillColor: const Color.fromRGBO(234, 233, 234, 1.0),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
          const SizedBox(height: 15),
          const Text('Пароль', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextField(
            controller: _passController,
            style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Пароль',
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(242, 242, 242, 1.0),
                  )
              ),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(234, 233, 234, 1.0),
                  )
              ),
              fillColor: const Color.fromRGBO(234, 233, 234, 1.0),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () async {
            final String login = _logController.text;
            final String password = _passController.text;

            final DataModel data = await createUser(login, password);

            setState(() {
              _data = data;
            });

            if (_data!.status.toString() == 'true') {
              showDialog(context: context, builder: (BuildContext context) =>
                  AlertDialog(
                    title: const Text('Регистрация успешна.'),
                    content: Text('ID -» '+_data!.id),
                    actions: <Widget>[
                      TextButton(
                        onPressed: (){
                          Navigator.popUntil(context, ModalRoute.withName('/main'));
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
              );
            }

            if (_data!.status.toString() == 'false') {
              showDialog(context: context, builder: (BuildContext context) =>
                  AlertDialog(
                    title: const Text('Ошибка авторизации'),
                    content: Text(_data!.message),
                    actions: <Widget>[
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
              );
            }
          }, child: const Text('Войти'), style: ElevatedButton.styleFrom(fixedSize: const Size(350, 40),)),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}