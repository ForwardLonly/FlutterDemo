import 'package:flutter/material.dart';


class ExpansionPanelItem {
  String headerText;
  Widget body;
  bool isExpanded;

  ExpansionPanelItem({required this.headerText, required this.body, required this.isExpanded});
}

class ExpansionpanelDemo extends StatefulWidget {
  const ExpansionpanelDemo({super.key});

  @override
  State<ExpansionpanelDemo> createState() => _ExpansionpanelDemoState();
}

class _ExpansionpanelDemoState extends State<ExpansionpanelDemo> {

  late List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();

    // 构造数据
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: "Panel A", 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel A"),
        ), 
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: "Panel B", 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel B"),
        ), 
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText: "Panel C", 
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel C"),
        ), 
        isExpanded: false
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) => {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = isExpanded;
                })
              },
              children: _expansionPanelItems.map(
                (ExpansionPanelItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder:  (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headerText, style: TextStyle(fontSize: 18.0)),
                      );
                    }, 
                  );
                }
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}