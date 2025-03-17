import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDatastatusDemo extends StatefulWidget {
  const GetDatastatusDemo({super.key});

  @override
  State<GetDatastatusDemo> createState() => _GetDatastatusDemoState();
}

class _GetDatastatusDemoState extends State<GetDatastatusDemo> {

  // 1.1 定义int类型的数据
  final RxInt _count = 0.obs;
  // 2.1 定义String类型的数据
  final RxString _titleString = "这是字符串".obs;
  // 3.1 定义List<String> 类型的数据
  final List<String> _listString = ["1", "2"].obs;
  // 4.1 定义一个内部带有obs数据的模型
  final Person _person = Person(userName: "猪猪".obs, age: 20.obs);
  // 5.1 定义一个常规的模型
  final Rx<Animal> _animal = Animal(kindName: "小猫", count: 1).obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据的状态管理"),
      ),
      body: ListView(
        children: [
          ListTile(
            // 1.2 用 Obx() 来更新局部的UI
            title: Obx((){
              return Text("count: ${_count.value}");
            }),
          ),
          ListTile(
            // 2.2 用 Obx() 来更新局部的UI
            title: Obx((){
              return Text("字符串：$_titleString");
            }),
          ),
           ListTile(
            // 3.2 用 Obx() 来更新局部的UI
            title: Obx((){
              return Text("字符串：${_listString.toString()}");
            }),
          ),
          ListTile(
            // 4.2 用 Obx() 来更新局部的UI
            title: Obx((){
              return Text("person-姓名：${_person.userName}");
            }),
          ),
          ListTile(
            // 5.2 用 Obx() 来更新局部的UI
            title: Obx((){
              return Text("animal-动物名：${_animal.value.kindName}");
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // 1.3 改变数据
          _count.value ++;
          // 2.3 改变数据
          _titleString.value = "$_titleString + 拼接$_count";
          // 3.3 改变数据
          _listString.add("拼接$_count");
          // 4.3 改变Person 的姓名字段
          _person.userName.value = "${_person.userName} + 拼接$_count";
          // 5.3 改变Animal 的种类字段
          _animal.value.kindName =  "${_animal.value.kindName} + 拼接$_count";
          _animal.refresh();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//-------定义一个内部变量为obs类型的模型类
class Person {
  RxString userName;
  RxInt age;

  Person({required this.userName, required this.age});
}


//-------定义一个常规模型
class Animal {
  String kindName;
  int count;

  Animal({required this.kindName, required this.count});
}