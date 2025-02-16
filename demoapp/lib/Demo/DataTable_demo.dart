import 'package:flutter/material.dart';
import '../Model/post.dart';

class DatatableDemo extends StatefulWidget {
  const DatatableDemo({super.key});

  @override
  State<DatatableDemo> createState() => _DatatableDemoState();
}

class _DatatableDemoState extends State<DatatableDemo> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTableDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
              // 设置排序的索引
              sortColumnIndex: _sortColumnIndex,
              // 设置排序的顺序
              sortAscending: _sortAscending,
              columns: [
                DataColumn(label: Text("Title"), onSort: (columnIndex, ascending) {
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;

                    posts.sort((a, b) {
                      // if (!ascending) {
                      //   // 降序排序
                      //   return b.title.length.compareTo(a.title.length);
                      // } else {
                      //   // 升序排序
                      //   return a.title.length.compareTo(b.title.length);
                      // }
                      if (!ascending) {
                        final c = a;
                        a = b;
                        b = c;
                      }
                      return a.title.length.compareTo(b.title.length);
                    });
                  });
                },),
                DataColumn(label: Text("Author")),
                DataColumn(label: Text("Image"))
              ], 
              rows: posts.map((post){
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (value) {
                    setState(() {
                      if (post.selected != value) {
                        if (value != null) {
                          post.selected = value;
                        }
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Container(padding: EdgeInsets.all(4.0), width: 60.0,child: Image.network(post.imageUrl),))
                  ]
                );
              }).toList()
            )
          ],
        ),
      ),
    );
  }
}