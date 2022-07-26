import 'package:assignment/additem.dart';
import 'package:assignment/displayitem.dart';
import 'package:flutter/material.dart';
import 'package:assignment/todoitem.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TodoItem> list = <TodoItem>[];

  @override
  void initState() {
    super.initState();
    addTodoItems();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo list"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (BuildContext context) {
                            setState(() {
                              list.remove(list[index]);
                              modifyList();
                            });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.close,
                          label: 'Delete',
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (BuildContext context) {
                            setState(() {
                              TodoItem.complete(list[index]);
                              modifyList();
                            });
                          },
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.check,
                          label: 'Complete',
                        ),
                      ],
                    ),
                    child: Material(
                      color:
                          list[index].completed ? Colors.green : Colors.white,
                      child: ListTile(
                        title: Text(list[index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayItem(
                                item: list[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddItem(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void addTodoItems() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? item = prefs.getString('List');
    setState(() {
      List<TodoItem> todoList = TodoItem.fromJSON(item);
      list = todoList.toList();
    });
  }

  void modifyList() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<TodoItem> itemList = list;
    String encodedData = TodoItem.toJSON(itemList);
    await prefs.setString("List", encodedData);
  }
}
