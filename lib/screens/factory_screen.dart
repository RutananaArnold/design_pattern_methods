import 'package:flutter/material.dart';

class FactoryMethodPage extends StatefulWidget {
  const FactoryMethodPage({super.key});

  @override
  State<FactoryMethodPage> createState() => _FactoryMethodPageState();
}

class _FactoryMethodPageState extends State<FactoryMethodPage> {
  final nameController = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'clothing';

  // List of items in our dropdown menu
  var items = [
    'clothing',
    'groceries',
    'electronics',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        TextFormField(
          controller: nameController,
          validator: ((value) =>
              value!.isNotEmpty ? null : "This field is required"),
          decoration: const InputDecoration(
              icon: Icon(
                Icons.label,
                color: Colors.black,
                size: 20,
              ),
              labelText: "Product Name",
              labelStyle: TextStyle(fontSize: 15),
              hintText: "Product name",
              hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              suffixStyle: TextStyle(color: Colors.green)),
        ),
        // category selection
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),

        // elevated button
        ElevatedButton(onPressed: () {}, child: const Text("Add product"))
      ],
    );
  }
}
