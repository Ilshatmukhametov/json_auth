import 'package:flutter/material.dart';
import 'package:untitled/auth.reg/auth.dart';
import 'package:untitled/auth.reg/registration.dart';

class testingPage extends StatefulWidget {
  final int selectedPage;

  const testingPage(this.selectedPage, {Key? key}) : super(key: key);


  @override
  State<testingPage> createState() => _testingPageState(selectedPage);
}

class _testingPageState extends State<testingPage> with TickerProviderStateMixin{
  int selectedPage;

  _testingPageState(this.selectedPage);

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 2, vsync: this);
    _tabController.index = selectedPage;

    return DefaultTabController(
        initialIndex: selectedPage,
        length: 2,
        child:Scaffold(
          backgroundColor: const Color.fromRGBO(234, 233, 234, 1.0),
          appBar: AppBar(),
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                        width: 30,
                            child: Image(image: AssetImage('assets/homag.png')),
                          ),
                          Text(' HOMAG RUSSLAND',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),)
                        ],
                      )
                  ),
              const SizedBox(height: 70),


              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(),
                    tabs: [
                      Row(
                        children: [
                          Container(
                            child: Text('Вход'),
                            padding: EdgeInsets.only(right: 30),
                          ),
                          Container(width: 1,height: 20, color: Colors.grey, margin: EdgeInsets.only(left: 15),)
                        ],
                      ),
                      Container(
                        child: Text('Регистрация'),
                        padding: EdgeInsets.only(left: 15),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: 400,
                padding: const EdgeInsets.all(15),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    autho(),
                    registr(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
        )
    );
  }
}

