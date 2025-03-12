import 'package:demoapp/Demo/Chip_demo.dart';
import 'package:demoapp/Demo/Hero_demo.dart';
import 'package:demoapp/Demo/Http/http_demo.dart';
import 'package:demoapp/Demo/NewsDemo/News_demo.dart';
import 'package:demoapp/Demo/Steam_demo.dart';
import 'package:demoapp/Demo/ThirdFramewordDemo/Third_Frameword_demo.dart';
import 'package:flutter/material.dart';
import 'CheckBox_demo.dart';
import 'RadioDemo.dart';
import 'SwitchDemo.dart';
import 'Slider_demo.dart';
import 'DateTime_demo.dart';
import 'SimpleDialog_demo.dart';
import 'AlertDialog_demo.dart';
import 'BottomSheet_demo.dart';
import 'SnackBar_demo.dart';
import 'ExpansionPanel_demo.dart';
import 'DataTable_demo.dart';
import 'PaginatedDataTable_demo.dart';
import 'Card_demo.dart';
import 'Stepper_demo.dart';
import 'StateManager_demo.dart';
import 'Animation_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialComponents"),
      ),
      body: ListView(
        children: [
          ListItem(title: "设备信息 + 网络检测 + 外部应用跳转", page: ThirdFramewordDemo()),
          ListItem(title: "新闻列表上下拉加载 + 加载html数据", page: NewsDemo()),
          ListItem(title: "SteamDemo", page: SteamDemo()),
          ListItem(title: "HeroDemo", page: HeroDemo()),
          ListItem(title: "AnimationDemo", page: AnimationDemo()),
          ListItem(title: "HttpDemo", page: HttpDemo()),
          ListItem(title: "StateManagerDemo", page: StateManagerScopteModelDemo()),
          // ListItem(title: "StateManagerDemo", page: StateManagerInheriteDemo()),
          // ListItem(title: "StateManagerDemo", page: StatemanagerDemo()),
          ListItem(title: "StepperDemo", page: StepperDemo()),
          ListItem(title: "CardDemo", page: CardDemo()),
          ListItem(title: "PagianbleDataTableList", page: PaginateddatatableDemo()),
          ListItem(title: "DataTableList", page: DatatableDemo()),
          ListItem(title: "ChipDemo", page: ChipDemo()),
          ListItem(title: "ExpansionPanelDemo", page: ExpansionpanelDemo()),
          ListItem(title: "SnackBarDemo", page: SnackbarDemo()),
          ListItem(title: "BottomSheetDemo", page: BottomsheetDemo()),
          ListItem(title: "AlertDialogDemo", page: AlertdialogDemo()),
          ListItem(title: "SimplyDialogDemo", page: SimpledialogDemo()),
          ListItem(title: "DateTimeDemo", page: DatetimeDemo()),
          ListItem(title: "SliderDemo", page: SliderDemo()),
          ListItem(title: "SwitchDemo", page: Switchdemo()),
          ListItem(title: "RadioDemo", page: RadioDemo()),
          ListItem(title: "CheckBoxDemo", page: CheckBoxDemo()),
          ListItem(title: "PopupMemuButtonDemo", page: PopupMemuButtonDemo()),
          ListItem(title: "ButtonBar", page: ButtonBarDemo()),
          ListItem(title: "ExpandButton", page: ExpandButtonDemo()),
          ListItem(title: "OutlineButton", page: OutlineButtonDemo()),
          ListItem(title: "ButtonDemo", page: ButtonDemo()),
          ListItem(title: "FloatingActionButton", page: FloatingActionButtonDemo())
        ],
      ),
    );
  }
}

//----ListItem---
class ListItem extends StatelessWidget {

  final String title;
  final Widget page;

  const ListItem({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

// ----FloatingActionButtonDemo---
class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {

    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: (){},
      elevation: 0.0,
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0)
      // ),
      child: Icon(Icons.add),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: (){}, 
      label: Text("add"),
      icon: Icon(Icons.add),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo")
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80.0,
        ),
      ),
    );
  }
}

//----文字按钮----
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 文字按钮
                TextButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    foregroundColor:WidgetStateProperty.all(Colors.orange),
                    backgroundColor: WidgetStatePropertyAll(Colors.redAccent)
                  ),
                  child: Text("Button"),
                ),

                TextButton(
                  onPressed: (){}, 
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Button")
                    ],
                  )
                ),
                SizedBox(width: 8.0),
                // 阴影按钮
                ElevatedButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Button")
                    ],
                  )
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}

//----描边按钮------
class OutlineButtonDemo extends StatelessWidget {
  const OutlineButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "OutLineButton"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: (){}, 
                label: Text("outlineButton"),
                icon: Icon(Icons.add),
                style: OutlinedButton.styleFrom(
                  overlayColor: Colors.orange,
                  side: BorderSide(
                    color: Colors.pink,
                    width: 1.0
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// ----按钮的大小-----
class ExpandButtonDemo extends StatelessWidget {
  const ExpandButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpandButtonDemo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.0,
                child: OutlinedButton(
                  onPressed: (){}, 
                  child: Text("firstButton")
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(onPressed: (){}, child: Text("secondButton"))
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16.0),
              Expanded(
                child: OutlinedButton(onPressed: (){}, child: Text("secondButton"))
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 2,
                child: OutlinedButton(onPressed: (){}, child: Text("secondButton"))
              ),
              SizedBox(width: 16.0),
            ],
          )
        ],
      ),
    );
  }
}

// ----ButtonBarDemo的案例-----
class ButtonBarDemo extends StatelessWidget {
  const ButtonBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonBarDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 32.0)
                    ),
                  ), 
                  child: OverflowBar(
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text("secondButton")),
                      OutlinedButton(onPressed: (){}, child: Text("secondButton"))
                    ],
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  padding: EdgeInsets.all(16.0),
                  
                  child:  OverflowBar(
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text("secondButton")),
                      OutlinedButton(onPressed: (){}, child: Text("secondButton"))
                    ]
                  )
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}

// ----PopupMemuButtonDemo的案例----
class PopupMemuButtonDemo extends StatefulWidget {
  const PopupMemuButtonDemo({super.key});

  @override
  State<PopupMemuButtonDemo> createState() => _PopupMemuButtonDemoState();
}

class _PopupMemuButtonDemoState extends State<PopupMemuButtonDemo> {
  String _currentMenuItem = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMemuButtonDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_currentMenuItem),
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      _currentMenuItem = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(value: "Home", child: Text("Home")),
                    PopupMenuItem(value: "Discover", child: Text("Discover") ),
                    PopupMenuItem(value: "My", child: Text("My"))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

