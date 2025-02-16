import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StatemanagerDemo extends StatefulWidget {
  const StatemanagerDemo({super.key});

  @override
  State<StatemanagerDemo> createState() => _StatemanagerDemoState();
}

class _StatemanagerDemoState extends State<StatemanagerDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateManagerDemo"),
      ),
      body: CounterWidget(count: _count, increaseCount: _increaseCount),
      floatingActionButton:  FloatingActionButton(
        onPressed: _increaseCount,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {

  final int count;
  final VoidCallback increaseCount;

  const CounterWidget({super.key, required this.count, required this.increaseCount});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text("$count"),
        onPressed: increaseCount
      )
    );
  }
}

//-------用InheritedWidget 实现数据的更新------
class StateManagerInheriteDemo extends StatefulWidget {
  const StateManagerInheriteDemo({super.key});

  @override
  State<StateManagerInheriteDemo> createState() => _StateManagerInheriteDemoState();
}

class _StateManagerInheriteDemoState extends State<StateManagerInheriteDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count, 
      increaseCount: _increaseCount, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("StateManagerDemo"),
        ),
        body: CounterWidgetInherite(),
        floatingActionButton:  FloatingActionButton(
          onPressed: _increaseCount,
          child: Icon(Icons.add),
        ),
      )
    );
    
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  const CounterProvider({super.key, required this.count, required this.increaseCount, required this.child}) : super(child: child);

  static CounterProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class CounterWidgetInherite extends StatelessWidget {
  const CounterWidgetInherite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final int? count = CounterProvider.of(context)?.count;
    final VoidCallback? increaseCount = CounterProvider.of(context)?.increaseCount;
    
    return ActionChip(
      label: Text("$count"),
      onPressed: increaseCount,
    );
  }
}


//-------用Scoped_Model 实现数据的更新-----
class StateManagerScopteModelDemo extends StatelessWidget {
  const StateManagerScopteModelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(), 
      child: Scaffold(
        appBar: AppBar(
          title: Text("StateManagerDemo"),
        ),
        body: CounterWidgetScopteModel(),
        floatingActionButton:  ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) {
            return FloatingActionButton(
              onPressed: model.increaseCount,
              child: Icon(Icons.add),
            );
          }
        ),
      )
    );
  }
}

class CounterWidgetScopteModel extends StatelessWidget {
  const CounterWidgetScopteModel ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) {
          return ActionChip(
              label: Text("count: ${model.count}"),
              onPressed: model.increaseCount,
          );
        }
      ),
    );
  }
}


class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    // 使用Model小部件的地方会监听Model的变化，可以用notifyListeners方法重建UI 
    notifyListeners();
  }
}