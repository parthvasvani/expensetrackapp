import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: now);
  }

  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
              controller: _titleController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.note_alt_outlined),
              hintText: "Enter Title",
              label: Text("Title"),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)))
            ),
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee),
                      hintText: "Enter Amount",
                      label: Text("Amount"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)))
                    ),
                  )
              ),

              SizedBox(width: 15,),

              Row(
                children: [
                  Text("Select Date"),
                  IconButton(onPressed: _presentDatePicker, icon: Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          Row(
            children: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("Cancel")),
              ElevatedButton(onPressed: () {
                if (kDebugMode){
                  print(_titleController.text);
                }
              }, child: Text("SaveExpenses"))
            ],
          )
        ],

      ),
    );
  }
}
