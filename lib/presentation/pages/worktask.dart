import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkTask extends StatefulWidget {
  const WorkTask({Key? key}) : super(key: key);

  static const String routeName = '/work task';

  @override
  _WorkTaskState createState() => _WorkTaskState();
}

class _WorkTaskState extends State<WorkTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  // list for save task
  List<Map<String, dynamic>> _tasks = [];

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
print("Picked Date: $pickedDate");
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _showAddWorkTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Work Task', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
              ),
        const SizedBox(height: 16,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                    border: OutlineInputBorder(),
              ),
                maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children:[
                Expanded(child: ElevatedButton(
                  onPressed: _pickDate,
                  child: Text(
                    _selectedDate == null ? 'Pick Due Date' : DateFormat('yyyy-MM-dd').format(_selectedDate!)
                  )
                ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: const Text('Cancel'),
              ),
                ElevatedButton(
                  onPressed: (){
                    if(_titleController.text.isNotEmpty){
                      setState(() {
                        _tasks.add({
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                          'date': _selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : 'No Due Date',
                        });
                      });
                      //Reset input fields
                      _titleController.clear();
                      _descriptionController.clear();
                      _selectedDate = null;

                      Navigator.pop(context);

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Title is Required')),
                      );
                    }
                  },
                  child: const Text('Save'),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF5C68A1),
        title: Row(
          children: [
            Image.asset(
              'assets/images/todolist.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            const Text(
              'Work Task',
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ],
        ),
      ),
      body: _tasks.isEmpty
        ? const Center(child: Text('No task yet, add some!', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25)))
      : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tasks.length,
        itemBuilder: (context, index){
          final task = _tasks[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(task['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (task['description'].isNotEmpty) Text(task['description']),
                  Text('Due: ${task['date']}', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
                trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: (){
                  setState(() {
                    _tasks.removeAt(index);
                  });
            },
            ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          _showAddWorkTaskBottomSheet(context);
        },
        child: Image.asset('assets/images/plus.png'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose(){
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
