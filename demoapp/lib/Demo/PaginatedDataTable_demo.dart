import 'package:flutter/material.dart';
import '../Model/post.dart';


class PaginateddatatableDemo extends StatefulWidget {
  const PaginateddatatableDemo({super.key});

  @override
  State<PaginateddatatableDemo> createState() => _PaginatedDatatableDemoState();
}

class _PaginatedDatatableDemoState extends State<PaginateddatatableDemo> {

  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  final PostDataSource _postDataSource = PostDataSource();

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
            PaginatedDataTable(
              header: Text("Post"),
              rowsPerPage: 10,
              source: _postDataSource, 
              // 设置排序的索引
              sortColumnIndex: _sortColumnIndex,
              // 设置排序的顺序
              sortAscending: _sortAscending,
              columns: [
                DataColumn(label: Text("Title"), onSort: (columnIndex, ascending) {
                  _postDataSource._sort((post) => post.title.length, ascending);

                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;
                  });
                },),
                DataColumn(label: Text("Author")),
                DataColumn(label: Text("Image"))
              ], 
            )
          ],
        ),
      ),
    );
  }
}

// 设置数据源
class PostDataSource extends DataTableSource {
  final _posts = posts;

  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow? getRow(int index) {
    final post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Container(padding: EdgeInsets.all(4.0), width: 60.0,child: Image.network(post.imageUrl),))
    ]);
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}