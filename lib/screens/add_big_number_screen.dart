import 'package:flutter/material.dart';
import '../utils/my_big_number.dart';

class AddBigNumberScreen extends StatefulWidget {
  const AddBigNumberScreen({super.key});

  @override
  State<AddBigNumberScreen> createState() => _AddBigNumberScreenState();
}

class _AddBigNumberScreenState extends State<AddBigNumberScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

  void handleSum() {
    final stn1 = num1Controller.text.trim();
    final stn2 = num2Controller.text.trim();

    if (stn1.isEmpty || stn2.isEmpty) {
      setState(() {
        result = "Vui lòng nhập đủ 2 số!";
      });
      return;
    }

    MyBigNumber myBigNumber = MyBigNumber();
    String sumResult = myBigNumber.sum(stn1, stn2);
    setState(() {
      result = sumResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cộng 2 số lớn"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: "Nhập số thứ nhất",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: "Nhập số thứ hai",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: handleSum,
              icon: const Icon(Icons.add),
              label: const Text("Cộng 2 số lớn"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Kết quả: $result",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
