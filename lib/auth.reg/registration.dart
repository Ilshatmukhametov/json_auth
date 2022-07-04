import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/JSON/UserModel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class registr extends StatefulWidget {
  const registr({Key? key}) : super(key: key);

  @override
  State<registr> createState() => _registrState();
}

Future<UserModel> createUser(String name, String gender, String birthday, String mobile, String email, String company, String service,
    String login, String password, String confirm,) async {
  const String apiUrl = "http://gg-web.ru/api/reg.php";

  final response = await http.post(Uri.parse(apiUrl), body: {
    "NAME": name,
    "PERSONAL_GENDER": gender,
    "PERSONAL_BIRTHDAY": birthday,
    "PERSONAL_MOBILE": mobile,
    "EMAIL": email,
    "WORK_COMPANY": company,
    "UF_SERVICE_NUMBER": service,
    "LOGIN": login,
    "PASSWORD": password,
    "CONFIRM_PASSWORD": confirm,
  });
  final String responseString = response.body;
  return userModelFromJson(responseString);

}

class _registrState extends State<registr> {

  var maskFormatterPhone = new MaskTextInputFormatter(
      mask: '+# ### ### ## ##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var maskFormatterData = new MaskTextInputFormatter(
      mask: '##.##.####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  String _selectedGender = '';
  bool isChecked = false;
  bool buttonenabled = false;
  UserModel? _user;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  MaterialStateProperty<Color?>? colorb = MaterialStateProperty.all<Color>(const Color.fromRGBO(33, 149, 242, 0.3));
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 1000,
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text('Ф.И.О', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Фамилия Имя Отчество',
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
              const Text('Пол', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    child: Radio<String>(
                      autofocus: false,
                      fillColor: MaterialStateProperty.all(Colors.grey),
                      value: 'Мужской',
                      splashRadius: 0,
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Container(child: const Text('Мужской', style: TextStyle(color: Colors.grey, fontSize: 13),),padding: const EdgeInsets.only(left: 5, right: 15)),
                  SizedBox(
                    width: 20,
                    child: Radio<String>(
                      autofocus: false,
                      fillColor: MaterialStateProperty.all(Colors.grey),
                      value: 'Женский',
                      groupValue: _selectedGender,
                      splashRadius: 0,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text('Женский', style: TextStyle(color: Colors.grey, fontSize: 13)),)
                ],
              ),
              const SizedBox(height: 15),
              const Text('Дата рождения', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [maskFormatterData],
                controller: _birthdayController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'дд.мм.гггг',
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
              const Text('Телефон', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextFormField(
                inputFormatters: [maskFormatterPhone],
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: '+7 900 000 00 00',
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
              const SizedBox(height: 15),
              const Text('Электронная почта', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Электронная почта',
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
              const SizedBox(height: 15),
              const Text('Наименование компании', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _companyController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Наименование компании',
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
              const SizedBox(height: 15),
              const Text('Сервисный номер', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _serviceController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: '1234567890',
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
              const SizedBox(height: 15),
              const Text('Логин', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _loginController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Логин',
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
              const SizedBox(height: 15),
              const Text('Пароль', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
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
              const SizedBox(height: 15),
              const Text('Подтвердите пароль', style: TextStyle(fontSize: 13, color: Color.fromRGBO(194, 194, 194, 1.0), fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              TextField(
                controller: _confirmController,
                style: const TextStyle(fontSize: 15, color: Colors.black45, fontWeight: FontWeight.w500),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.grey,
                      value: isChecked,
                      shape: const CircleBorder(),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked == false) {
                            setState(() {
                              colorb = MaterialStateProperty.all<Color>(const Color.fromRGBO(33, 149, 242, 0.3));
                              buttonenabled = false;
                            });
                          }
                          if (isChecked == true) {
                            setState(() {
                              colorb = MaterialStateProperty.all<Color>(const Color.fromRGBO(33, 149, 242, 1.0));
                              buttonenabled = true;
                            });
                          }

                        });
                      },
                    ),
                    width: 20,
                    height: 20,
                  ),
                  Container(padding:const EdgeInsets.only(left: 10),height:50,width:300,child: const Text('Подтверждаю корректность введенных данных и даю согласие на обработку моих персональных данных'),)

                ],
              ),
              const SizedBox(height: 10,),

              ElevatedButton(onPressed: buttonenabled?()async{
                final String name = _nameController.text;
                final String gender = _selectedGender;
                final String birthday = _birthdayController.text;
                final String mobile = _mobileController.text;
                final String email = _emailController.text;
                final String company = _companyController.text;
                final String service = _serviceController.text;
                final String login = _loginController.text;
                final String password = _passwordController.text;
                final String confirm = _confirmController.text;

                final UserModel user = await createUser(name, gender, birthday, mobile, email, company, service, login, password, confirm);

                setState(() {
                  _user = user;
                });

                if (_user!.status == 'TRUE') {
                  showDialog(context: context, builder: (BuildContext context) =>
                      AlertDialog(
                        title: const Text('Регистрация успешна.'),
                        content: Text('ID -» '+_user!.userId),
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

                if (_user!.status == 'FALSE') {
                  showDialog(context: context, builder: (BuildContext context) =>
                      AlertDialog(
                        title: const Text('Ошибка регистрации'),
                        content: Text(_user!.message),
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
              }:null, child: const Text('Зарегистрироваться',style: TextStyle(color: Colors.white,fontSize: 14),),style: ButtonStyle(backgroundColor: colorb, padding: MaterialStateProperty.all(const EdgeInsets.only(left: 105, right: 105, top: 14, bottom: 14)),),),
            ],
          ),
        ),
      ],
    );
  }
}