import 'package:assignment/home.dart';
import 'package:assignment/todoitem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Container(
        height: height,
        width: width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Title",
                  labelStyle: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Enter a title",
                  hintStyle: TextStyle(
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Description",
                  labelStyle: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Enter a description",
                  hintStyle: TextStyle(
                    fontSize: height / 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  addItem();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addItem() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<TodoItem> itemList = TodoItem.fromJSON(prefs.getString("List"));
    TodoItem item = TodoItem(
        title: _titleController.text, description: _descriptionController.text);
    itemList.add(item);
    String encodedData = TodoItem.toJSON(itemList);
    await prefs.setString("List", encodedData);
  }
}
